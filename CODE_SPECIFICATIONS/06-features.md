# 06 — Features

This document defines the exact logic, algorithms, and behavior for every feature. A coding agent should be able to implement each section without making logic decisions of its own.

---

## 1. Authentication

### 1.1 Auth State Model

```dart
sealed class AuthState {}
class AuthAuthenticated extends AuthState { final AppUser user; }
class AuthGuest extends AuthState { final String deviceId; }
class AuthSignedOut extends AuthState {}
```

The app **always** has an auth state. There is never a "null" state. Guest is a first-class state.

### 1.2 Google Sign-In Flow
1. User taps "Continue with Google"
2. Call `google_sign_in.signIn()`
3. Obtain ID token, sign into Firebase Auth
4. On success, check Firestore `/users/{uid}`:
   - If exists → update `lastSeenAt`
   - If not → create user doc with default preferences
5. Run `MigrateGuestAttemptsUseCase` (silent)
6. Navigate to `/`

### 1.3 Email Sign-In Flow
1. Validate email + password client-side
2. Call `firebaseAuth.signInWithEmailAndPassword`
3. Same post-login steps as Google

### 1.4 Signup Flow
1. Validate display name (2-30 chars), email, password (8+ chars)
2. Call `firebaseAuth.createUserWithEmailAndPassword`
3. Update user's displayName via `user.updateDisplayName`
4. Create `/users/{uid}` doc
5. Same post-login steps

### 1.5 Guest Session
- On first launch (no auth, no prior guest), generate `deviceId = const Uuid().v4()` and store in Hive `app_state` box.
- Set auth state to `AuthGuest(deviceId)`.
- All subsequent quiz attempts include this `deviceId`.

### 1.6 Sign Out
1. Call `firebaseAuth.signOut()`
2. Call `googleSignIn.signOut()` (if applicable)
3. Auth state automatically transitions to `AuthGuest(deviceId)` (NOT signed out — same device, just no account)
4. Clear in-memory caches, but **keep** Hive local data for the device
5. Navigate to `/login` to give them a chance to re-authenticate

---

## 2. Quiz Code Generation

### 2.1 Code Format
- Length: **6 characters**
- Character set: `ABCDEFGHJKLMNPQRSTUVWXYZ23456789` (32 chars; excludes I, O, 0, 1)
- Display: shown to user as 6 uppercase chars, no separator
- Example: `QZ4XKN`, `MR8PHC`

### 2.2 Generation Algorithm
```dart
String generateCode() {
  const charset = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
  final random = Random.secure();
  return List.generate(6, (_) => charset[random.nextInt(charset.length)]).join();
}
```

### 2.3 Uniqueness Check
Before publishing:
```dart
Future<String> generateUniqueCode(QuizRepository repo) async {
  for (var i = 0; i < 5; i++) {
    final code = generateCode();
    final exists = await repo.codeExists(code);
    if (!exists) return code;
  }
  throw const QuizCodeGenerationException('Could not generate a unique code after 5 attempts');
}
```

### 2.4 Code Input Parsing
- User types `qz4xkn` or `q-z-4-x-k-n` → strip non-alphanumeric, uppercase, validate length 6
- If user pastes a full link like `https://quizly.link/QZ4XKN`, extract last 6 chars after trim

---

## 3. Quiz Creation

### 3.1 Quiz Model Validation
Before publish:
- `title.trim()`: 1-80 chars
- `description.trim()`: 0-200 chars (optional)
- `questions.length >= 1`
- Each question valid:
  - `text.trim()`: 1-300 chars
  - For MCQ: 4 non-empty options
  - For T/F: options are exactly `["True", "False"]`
  - `correctIndex` within bounds
- If `perQuestionTimerSec != null`: must be 5-300 seconds
- If `deadlineAt != null`: must be > now + 5 minutes

### 3.2 Question Ordering
- Questions have an `index` field (0-based)
- Reordering updates `index` for affected questions
- Storage uses index as part of doc ID for natural sort: `q_00`, `q_01`, etc.

### 3.3 Publish Flow
```
1. Validate quiz draft
2. Generate unique code
3. Write quiz doc to /quizzes/{auto-id} with code field
4. Batch-write all questions to /quizzes/{quizId}/questions/q_NN
5. Update local quiz cache (Hive)
6. Return quizId
```

Wrapped in a Firestore batch where possible. If batch fails partway, retry the whole thing.

### 3.4 Draft Auto-Save
- Every 5 seconds while CreateQuizScreen is mounted, if state is dirty, save to Hive `quiz_drafts` box.
- On screen mount, check for existing draft and offer to restore via bottom sheet.

### 3.5 Edit Restrictions
- A quiz can only be edited if `stats.attemptCount == 0`.
- If edits attempted on a quiz with attempts, show error: "Can't edit — people have already attempted this quiz."

---

## 4. Quiz Attempt

### 4.1 Attempt Lifecycle
```
draft (in-memory) → in_progress (Firestore) → submitted (Firestore)
                                            ↘ abandoned (Firestore) if user exits
```

### 4.2 Starting an Attempt
1. User on Attempt Intro screen, taps "Start Quiz"
2. Create a new `Attempt` object in memory:
   ```dart
   Attempt(
     id: const Uuid().v4(),
     quizId: quiz.id,
     quizCode: quiz.code,
     attempterId: currentUser?.uid,
     attempterName: enteredName,
     deviceId: deviceId,
     isAnonymous: quiz.settings.allowAnonymous,
     answers: [],
     status: AttemptStatus.inProgress,
     startedAt: DateTime.now(),
   )
   ```
3. Save to local Hive `pending_attempts` box (recovery purposes)
4. Optimistically write to Firestore as `in_progress`
5. Navigate to first question

### 4.3 Answering a Question
1. User taps an option → store selection in local attempt state
2. User taps "Next" → call `submitAnswer(questionIndex, selectedIndex, timeTakenMs)`
3. `submitAnswer`:
   - Lookup correct answer from quiz model
   - Compute `isCorrect`
   - Append `Answer` to `attempt.answers`
   - Persist to Hive
   - If `revealMode == afterEach`: show overlay for 1.5s
4. Move to next question

### 4.4 Timer Logic
For per-question timer:
1. On entering question screen, start a `Timer.periodic(Duration(seconds: 1))`
2. Decrement remaining seconds, update UI
3. At 0:
   - Capture current selection (or null)
   - Auto-call `submitAnswer` with `timeTakenMs = quiz.settings.perQuestionTimerSec * 1000`
4. Pause timer when app is backgrounded; resume on foreground
5. Cancel timer on screen dispose

### 4.5 Finishing an Attempt
1. After last question answered, call `finishAttempt()`
2. Compute score:
   ```dart
   final correct = answers.where((a) => a.isCorrect).length;
   final total = answers.length;
   final percentage = (correct / total * 100).round();
   final totalTimeMs = answers.fold<int>(0, (sum, a) => sum + a.timeTakenMs);
   ```
3. Compute rank by querying:
   ```dart
   firestore.collection('attempts')
     .where('quizId', isEqualTo: quizId)
     .where('status', isEqualTo: 'submitted')
     .where('score.percentage', isGreaterThan: thisPercentage)
     .count();
   // rank = countAbove + 1
   ```
4. Update attempt doc to `submitted` status with computed fields
5. Update quiz `stats` (atomic transaction):
   - Increment `attemptCount`
   - Update `averageScore` (running average)
   - Update `hardestQuestionIndex` if needed
6. Navigate to result screen

### 4.6 Score Computation Details
- Correct answer: +1 point
- Wrong / skipped / timed-out: 0 points
- Percentage = (correct / total) × 100, rounded to nearest int
- Time bonus or penalty: **none in MVP** (keep scoring simple)

### 4.7 Resume Interrupted Attempt
On app start:
1. Check Hive `pending_attempts` box for any `in_progress` attempts
2. If found and quiz is still live and within deadline:
   - Show bottom sheet: "You have an unfinished attempt of '[quiz title]'. Resume?"
   - On resume: load attempt state, navigate to next unanswered question
3. If not resumable: mark as `abandoned`, clear local

### 4.8 Duplicate Attempt Prevention
- Default: allow multiple attempts (different attempts are different docs, different rank scores apply)
- Future setting (not MVP): "one attempt per device"

---

## 5. Reveal Modes

### 5.1 `afterEach` Mode
- After user selects + submits an answer, show a 1.5s overlay:
  - Background: dimmed with success or danger color tint
  - Big check or cross icon
  - "Correct!" or "Not quite" label
  - For wrong answers, also show "Correct answer: [option]"
- After overlay, proceed to next question
- On result screen, show full breakdown

### 5.2 `atEnd` Mode
- During quiz: no feedback per question; user just sees their selection
- On result screen:
  - If quiz has no deadline → show full breakdown immediately
  - If quiz has deadline AND deadline not passed → show only score; full breakdown locked with message "Results revealed when quiz closes (in 3h 12m)"
  - When deadline passes, all attempters get push notification + breakdown unlocks

### 5.3 `none` Mode
- No per-question feedback
- On result screen: only score + leaderboard, no breakdown ever shown
- Useful for serious assessments where leakage is bad

---

## 6. Leaderboard

### 6.1 Query
```dart
firestore.collection('attempts')
  .where('quizId', isEqualTo: quizId)
  .where('status', isEqualTo: 'submitted')
  .orderBy('score.percentage', descending: true)
  .orderBy('submittedAt', descending: false)  // earlier submission breaks tie
  .limit(100)
```

### 6.2 Tie-Breaking Rules
1. Higher percentage wins
2. If tied: shorter total time wins
3. If still tied: earlier submission time wins

Update orderBy accordingly:
```dart
.orderBy('score.percentage', descending: true)
.orderBy('score.totalTimeMs', descending: false)
.orderBy('submittedAt', descending: false)
```

(Note: this requires an additional composite index — add to `firestore.indexes.json`.)

### 6.3 "Your Rank" Display
- If user is in top 100: highlight their row
- If user is NOT in top 100: show sticky footer "Your rank: #234" computed via count query

### 6.4 Real-Time Updates
- Use `snapshots()` stream on leaderboard query
- New attempts appear live with subtle slide-in animation

### 6.5 Anonymous Entries
- If `isAnonymous == true`, display as "Guest" or the entered name
- If user is logged in but quiz allows anonymous, they can choose

---

## 7. Notifications (FCM)

### 7.1 Token Management
1. On app start (post-Firebase init):
   - Request notification permission (iOS)
   - Get FCM token via `firebaseMessaging.getToken()`
   - Get deviceId from Hive
   - Write to `/device_tokens/{deviceId}`:
     ```jsonc
     {
       "deviceId": "...",
       "fcmToken": "...",
       "platform": "android",
       "linkedUserId": <uid or null>,
       "updatedAt": <serverTimestamp>,
       "subscribedQuizIds": [...] // preserved if doc exists
     }
     ```
2. Listen for `onTokenRefresh` and re-write to Firestore

### 7.2 Subscribing to a Quiz
When a user attempts a quiz, automatically add `quizId` to their `subscribedQuizIds` array.
When a user creates a quiz, also subscribe.

### 7.3 Notification Types

**A. Quiz Deadline Reached**
- Trigger: scheduled Cloud Function (out of MVP) OR client-side check on app open: if deadline passed and result not seen, mark as ready
- For MVP without Functions: store a `revealedAt` on quiz when first user opens the quiz post-deadline; this triggers notification fan-out via the client
- For MVP simplest path: client polls quiz on Result screen if deadline approaches; show local notification when passed
- Payload:
  ```jsonc
  {
    "title": "Results are in!",
    "body": "Your score for '[Quiz Title]' is now revealed",
    "data": { "type": "deadline_reveal", "quizId": "...", "attemptId": "..." }
  }
  ```

**B. Someone Attempted Your Quiz (debounced)**
- Trigger: new attempt submitted
- Debounce: at most one notification per quiz per day per creator
- For MVP: use a local check via Cloud Function (post-MVP) OR skip in v1 and add via Functions later
- Payload:
  ```jsonc
  {
    "title": "Someone took your quiz!",
    "body": "[N] new attempts on '[Quiz Title]'",
    "data": { "type": "new_attempt", "quizId": "..." }
  }
  ```

**C. Challenge Received**
- Trigger: When a challenge link is created targeting a specific device, send to that device
- Note: for MVP, we don't know recipient until they open the link, so this is more of a "you've been challenged" prompt on link open rather than push
- This means **challenge push notification is not in MVP** (deferred)

### 7.4 Foreground vs Background Handling
- Foreground: use a snackbar or in-app banner instead of system notification (to avoid duplicates)
- Background/terminated: standard system notification
- Tap notification: deep link into app to appropriate screen using `data` payload

### 7.5 Local Notifications (deadline reminders)
- When user attempts a quiz with a deadline, schedule a local notification 1 hour before deadline:
  - "Quiz '[title]' closes in 1 hour"
  - Use `flutter_local_notifications` package
- Cancel notification on submit

---

## 8. Deep Linking

See `08-deeplinks.md` for full Branch.io setup. Summary here:

### 8.1 Link Types
- **Quiz code link**: `quizly.link/q/QZ4XKN` → app opens to `/attempt/intro/QZ4XKN`
- **Challenge link**: `quizly.link/c/<challengeId>` → app opens to `/challenge/:challengeId`
- **Profile link** (future): `quizly.link/u/<username>` — not MVP

### 8.2 Web Fallback
If app not installed and user can't install for some reason:
- Show a minimal landing page with the quiz title and a "Download to play" prompt
- Page hosted on Firebase Hosting

### 8.3 Link Generation
- On quiz publish: pre-generate the share link via Branch.io API and store in `quiz.shareLink` field (denormalized for fast share)
- On challenge create: generate fresh link per challenge

---

## 9. Share Card Generation

When user taps "Share Result":

1. Create an off-screen widget tree representing the share card:
   - Quiz title
   - User's score (big)
   - Top 3 leaderboard
   - "Beat me: quizly.link/q/QZ4XKN"
   - Branded with logo + colors
2. Use `screenshot` package to capture as PNG (1080x1920 portrait)
3. Save to temp dir
4. Open share sheet with image + text message:
   - "I scored 8/10 on '[quiz]' — beat me: quizly.link/q/QZ4XKN"
5. Track analytics event `share_result`

### Image Specs
- 1080 × 1920 (Instagram story format)
- Background: same as result hero band color
- Top: app logo + quiz title
- Middle: huge "8 / 10" + rank
- Bottom: link as text + tiny qr code

---

## 10. Challenge System

### 10.1 Creating a Challenge
1. User on Result screen taps "Challenge a Friend"
2. App creates Firestore doc in `/challenges`:
   ```dart
   {
     "quizId": ...,
     "challengerAttemptId": thisAttemptId,
     "challengerName": ...,
     "challengerScore": percentage,
     "challengerScoreText": "8/10",
     "createdAt": serverTimestamp,
     "expiresAt": now + 30 days,
     "acceptedBy": [],
   }
   ```
3. Generate Branch.io link with `c/<challengeId>` path
4. Open share sheet with:
   - Pre-filled message: "Beat my 8/10 on [quiz] — quizly.link/c/abc"

### 10.2 Accepting a Challenge
1. Recipient opens link → app launches to `/challenge/:challengeId`
2. Fetch challenge doc
3. Append recipient's deviceId to `acceptedBy` array
4. Show challenge intro screen
5. On "Take the Challenge", navigate to attempt with `challengerAttemptId` carried
6. After attempt, result screen shows VS comparison row

### 10.3 Vs Comparison on Results
```
┌─────────────────────────────┐
│  YOU vs ARYAN               │
│  ┌──────┐         ┌──────┐  │
│  │ 9/10 │   >     │ 8/10 │  │
│  └──────┘         └──────┘  │
│       You won! 🎉           │
└─────────────────────────────┘
```

---

## 11. Guest to Account Migration

### 11.1 Trigger
- User signs up OR logs into an existing account for the first time on this device

### 11.2 Algorithm
```dart
Future<MigrationResult> migrateGuestData({
  required String newUid,
  required String deviceId,
}) async {
  // 1. Find guest attempts (attempterId == null, deviceId == thisDevice)
  final guestAttempts = await firestore
    .collection('attempts')
    .where('deviceId', isEqualTo: deviceId)
    .where('attempterId', isEqualTo: null)
    .get();

  // 2. Batch-update them
  final batch = firestore.batch();
  for (final doc in guestAttempts.docs) {
    batch.update(doc.reference, {
      'attempterId': newUid,
      // keep attempterName as-is — they entered it intentionally
    });
  }
  await batch.commit();

  // 3. Update device_tokens
  await firestore.collection('device_tokens').doc(deviceId).update({
    'linkedUserId': newUid,
  });

  return MigrationResult(migratedCount: guestAttempts.docs.length);
}
```

### 11.3 UI Feedback
- Silent migration — no UI shown
- If `migratedCount > 0`, show snackbar on home after first sign-in: "Your previous quizzes are now saved to your account"

### 11.4 Edge Cases
- User logs into an existing account: still merge — they may have had a guest session before this account existed
- Conflicts: none expected since attempts are tied to unique IDs

---

## 12. Reporting

### 12.1 Report Submission
- User taps "Report" from quiz menu
- Bottom sheet appears with reason chips: Inappropriate, Spam, Incorrect info, Other
- If "Other": text field for details
- Submit creates a `/reports` doc
- Toast confirmation: "Thanks for letting us know"

### 12.2 Admin Side (out of scope)
- Reports reviewed manually via Firebase console
- Automatic action threshold (e.g., 5 reports → auto-hide) — future

---

## 13. Offline Behavior

### 13.1 What Works Offline
- Viewing cached quizzes (Created list, Attempted list from local Hive)
- Attempting a quiz if it was already cached (fetched once while online)
- Saving attempt to local queue

### 13.2 What Doesn't Work Offline
- Entering a new code (requires Firestore read)
- Viewing live leaderboard
- Receiving notifications

### 13.3 Queue Sync
- A `PendingSubmissionsService` runs whenever connectivity is restored
- Iterates `pending_submissions` Hive box, attempts to upload each
- On success: remove from queue
- On failure: keep in queue, retry exponential backoff

---

## 14. Search & Discovery (Minimal in MVP)

- No public discovery feed in MVP
- Code entry is the only way to find a quiz
- Future: search by category, tags, popularity

---

## 15. Analytics Events

Send these via Firebase Analytics:

| Event | Params |
|---|---|
| `app_open` | source (cold/warm/deep_link) |
| `signup` | method (google, email) |
| `login` | method |
| `quiz_create_start` | — |
| `quiz_publish` | questionCount, hasTimer, hasDeadline, revealMode |
| `quiz_attempt_start` | quizId, isGuest |
| `quiz_attempt_finish` | quizId, score, percentage |
| `share_result` | quizId, score |
| `challenge_create` | quizId |
| `challenge_accept` | challengeId |
| `report_quiz` | quizId, reason |

Keep event payloads small. Don't log PII.

---

## 16. Performance Targets

- Cold start: < 2.5s on mid-range Android
- Time-to-first-question after entering code: < 1.5s on 4G
- Animation framerate: 60fps consistently
- Hive read on home screen: < 50ms
- Firestore read on code lookup: < 500ms

Profile with Flutter DevTools before each release.
