# 05 — Screens

This document describes every screen in the MVP. Each screen entry includes:
- Purpose
- Route
- Layout structure
- Components used
- States (loading, error, empty, etc.)
- User interactions and outcomes
- Edge cases

A coding agent should treat each screen entry as a complete spec.

---

## Screen Index

1. Splash
2. Onboarding (3 quick slides, optional)
3. Login
4. Signup
5. Home
6. Create Quiz
7. Add Question
8. Quiz Published (post-publish success)
9. Quiz Detail (creator dashboard)
10. Attempt Intro (name entry)
11. Attempt Question
12. Attempt Result
13. Leaderboard (full)
14. Challenge Intro

---

## 1. Splash Screen

**Route:** `/splash` (initial route)
**Purpose:** Boot the app, initialize services, decide where to go next.

**Layout:**
- Full-screen, centered.
- Quizly logo (Nunito italic, display-lg, ink color) centered.
- 16px below: tiny tagline in body-xs, ink-3 color: "Quizzes, shared simply."

**Behavior:**
1. On mount: initialize Firebase, Hive, Branch.io listener, fetch FCM token.
2. Check auth state.
3. Check for pending deep link.
4. After max 1.5s OR all initialization complete (whichever first):
   - If deep link to attempt or challenge → navigate there
   - Else if first-time install → `/onboarding`
   - Else if authenticated → `/`
   - Else → `/login`

**Edge cases:**
- If Firebase fails to init (no network), still proceed to `/` and let downstream handle.
- If Branch.io takes >2s, give up and proceed.

---

## 2. Onboarding (3 slides, optional)

**Route:** `/onboarding`
**Purpose:** Quick value-prop intro.

**Layout per slide:**
- Top: page indicator dots (3 dots, active = orange, inactive = border)
- Center: illustration or emoji (56pt)
- Below: heading-lg title
- Below: body-md description
- Bottom-right: "Skip" text button
- Bottom-center: Primary Button "Continue" / "Get Started" on last slide

**Slide content:**

| # | Title | Description |
|---|---|---|
| 1 | "Make quizzes in minutes" | "Add questions, set a timer, share a code. That's it." |
| 2 | "Anyone can attempt" | "Share the code with friends. No accounts required." |
| 3 | "See who's on top" | "Live leaderboard, results when the deadline hits." |

**Behavior:**
- Swipe left/right between slides
- Skip → set `has_seen_onboarding = true` in Hive, navigate to `/login`
- Get Started on slide 3 → same as Skip

---

## 3. Login Screen

**Route:** `/login`
**Purpose:** Sign in.

**Layout:**
```
SafeArea
└── Padding(18, top: 24)
    └── Column
        ├── Quizly logo (display-md, ink)
        ├── space-6 (24)
        ├── heading-lg "Welcome back"
        ├── space-2 (8)
        ├── body-md ink-3 "Sign in to create and share quizzes"
        ├── space-7 (32)
        ├── Google Sign-In button (Primary style with Google icon left)
        ├── space-3 (12)
        ├── Divider with "or" text (centered)
        ├── space-3
        ├── Email input field
        ├── space-3
        ├── Password input field
        ├── space-2
        ├── "Forgot password?" text button, right-aligned
        ├── space-4
        ├── Primary Button "Sign In"
        ├── space-6
        └── Row: body-md "New here? " + text button "Create account" → /signup
```

**Validation:**
- Email: standard regex, must contain `@` and `.`
- Password: minimum 8 chars
- Inline errors below field on submit attempt

**Behavior:**
- Google Sign-In: trigger Firebase Google auth flow, then navigate to `/`
- Email Sign-In: validate, call Firebase auth, on success navigate to `/`
- Forgot password: send reset email, show snackbar confirming

**Edge cases:**
- Wrong password → field error "Incorrect email or password" (don't disclose which)
- Network error → snackbar "Couldn't sign in. Check your connection."
- Account doesn't exist on email sign-in → snackbar with "Create one?" action

**"Continue as guest" option:**
- Below the entire form, a text button "Continue without account" → sets up a guest session and navigates to `/`

---

## 4. Signup Screen

**Route:** `/signup`
**Purpose:** Create account.

**Layout:** Same as Login but:
- heading-lg "Create an account"
- Adds a Display Name field at the top
- "Sign Up" instead of "Sign In"
- Bottom switches to "Already have an account? Sign in"

**Validation:**
- Display name: 2-30 chars, no special chars except space, ', .
- Email + password: same as login
- Adds password strength indicator (a 4-segment bar that fills based on length + variety)

**On success:**
- Create user doc in Firestore `/users/{uid}`
- If guest data exists locally, trigger `MigrateGuestAttemptsUseCase`
- Navigate to `/`

---

## 5. Home Screen

**Route:** `/`
**Purpose:** Dashboard. Entry to all flows.

**Layout:**
```
SafeArea
└── Padding(18, top: 14)
    └── Column
        ├── TopRow: Logo + Avatar (32x32 emoji or initials in tinted bg)
        ├── space-5 (20)
        ├── CodeEntryCard (the dark hero card — see component spec)
        ├── space-5
        ├── TabSwitcher (Created | Attempted)
        ├── space-3
        ├── Expanded ListView
        │   └── List of QuizCards or AttemptCards based on tab
        └── BottomBar: "New quiz" text + "+ Create" primary mini-button
            (only visible on Created tab)
```

**TopRow detail:**
- Avatar tap → opens profile/settings bottom sheet

**CodeEntryCard detail:**
- Dark background (ink), padded 16x18px
- Top row: "Enter code" label + small "Jump into a quiz" hint right-aligned
- Bottom row: a 6-char input mock + amber arrow button
- Tapping anywhere on the card opens a focused full-width input
- Validates length 6, fetches quiz from Firestore via repo
- On valid code: navigate to `/attempt/intro/:code`
- On invalid: shake animation + error chip below "We couldn't find that quiz"

**TabSwitcher detail:**
- Two tabs: "Created" and "Attempted"
- Default to "Created" for logged-in users
- For guest users: hide "Created" tab entirely; only show "Attempted"

**Created list:**
- Quiz cards sorted by most recent first
- Each card tappable → `/quiz/:quizId` (creator dashboard)
- Long-press → bottom sheet with "Edit", "Delete", "Copy code", "Share"
- Empty state: "Create your first quiz" with illustration

**Attempted list:**
- Attempt cards with quiz title, date, score
- Tappable → `/attempt/result/:attemptId`
- Empty state: "Enter a code above to attempt a quiz"

**Pull-to-refresh:** triggers re-fetch of both lists.

**Edge cases:**
- No internet: show local cached data, top banner "You're offline" with retry button
- Auth state changes (logout from another device): redirect to /login

---

## 6. Create Quiz Screen

**Route:** `/quiz/create`
**Purpose:** Build a new quiz.

**Layout:**
```
SafeArea
└── Padding(18, top: 14)
    └── Column
        ├── TopBar: ← Back, "New Quiz" title, "Save draft" text button right
        ├── space-5
        ├── ScrollView
        │   ├── Quiz title field (label + AppTextField)
        │   ├── space-3
        │   ├── Description field (optional, multiline up to 200 chars)
        │   ├── space-4
        │   ├── Settings section:
        │   │   ├── overline "SETTINGS"
        │   │   ├── space-2
        │   │   ├── Allow anonymous toggle row
        │   │   ├── space-2
        │   │   ├── Reveal mode picker (3 chips: After each / At end / No reveal)
        │   │   ├── space-2
        │   │   ├── Per-question timer picker (Off | 15s | 30s | 60s | Custom)
        │   │   ├── space-2
        │   │   └── Deadline picker (Off | 1 hour | 24 hours | Custom datetime)
        │   ├── space-5
        │   ├── Questions section:
        │   │   ├── overline "QUESTIONS"
        │   │   ├── space-2
        │   │   ├── List of QuestionPills (Q1, Q2, ...) — each tappable to edit, draggable to reorder
        │   │   └── AddQuestionButton (dashed border, centered "+ Add question")
        │   └── space-7
        └── BottomBar: Primary Button "Publish & Get Code"
```

**Validation before publish:**
- Title required, 1-80 chars
- At least 1 question required
- If timer is "Custom" → must specify
- If deadline is "Custom" → must be in the future

**Behavior:**
- Tap question pill → `/quiz/create/question` (edit mode with that question)
- Tap Add → `/quiz/create/question` (new mode)
- Save draft: writes to Hive only, no Firestore
- Publish: validates all, generates code with retry-on-collision, writes to Firestore, navigates to `/quiz/published/:quizId`

**Edge cases:**
- App backgrounded with unsaved changes: auto-save to Hive every 5 seconds
- Publish fails (network): keep state, show "Try again" snackbar

---

## 7. Add Question Screen

**Route:** `/quiz/create/question`
**Purpose:** Add or edit a single question.

**Layout:**
```
SafeArea
└── Padding(18, top: 14)
    └── Column
        ├── TopBar: ← Back, "Question" title, "Save" text button right
        ├── space-5
        ├── Question type picker (segmented: MCQ | True/False)
        ├── space-4
        ├── Question text field (multiline, max 300 chars)
        ├── space-4
        ├── overline "OPTIONS"
        ├── space-2
        ├── For MCQ: 4 option rows, each with:
        │   - Key bubble (A/B/C/D)
        │   - Text input
        │   - Tap-to-mark-correct circle right (radio-style)
        ├── For T/F: 2 option rows pre-filled True/False, only mark correct
        ├── space-4
        ├── Optional explanation field
        ├── overline label "EXPLANATION (Optional)" + body-xs "Shown after the quiz if reveal is on"
        └── BottomBar: Primary Button "Save Question"
```

**Validation:**
- Question text required (1-300 chars)
- All option texts required for MCQ
- Exactly one correct answer must be marked

**Behavior:**
- Save adds the question to the in-memory draft and pops back to Create Quiz screen
- If editing existing: replace in list, preserving index

---

## 8. Quiz Published Screen

**Route:** `/quiz/published/:quizId`
**Purpose:** Celebrate publish, show the code, prompt to share.

**Layout:**
```
SafeArea
└── Padding(18, top: 14)
    └── Column
        ├── TopBar: × close (top right) → /
        ├── space-7 (32)
        ├── Centered:
        │   ├── Big emoji or icon (56pt) — 🎉 or trophy
        │   ├── space-3
        │   ├── heading-lg "Your quiz is live"
        │   ├── space-2
        │   ├── body-md ink-3 "Share this code or link"
        │   ├── space-6
        │   ├── Code display card:
        │   │   - Big code in mono 32px, letter-spacing 0.2em
        │   │   - Tap to copy (shows "Copied" toast)
        │   ├── space-4
        │   └── Share link card:
        │       - Truncated link "quizly.link/QZ4X9K"
        │       - Copy icon
        ├── space-7
        └── BottomBar:
            ├── Primary Button "Share Now"
            └── space-2
            └── Secondary Button "Go to Dashboard" → /quiz/:quizId
```

**Behavior:**
- Tap code → copy, haptic feedback, toast "Code copied"
- Tap "Share Now" → opens native share sheet with formatted message:
  - "Take my quiz: [title] — Code: QZ4X9K or open quizly.link/QZ4X9K"
- Close → home

---

## 9. Quiz Detail Screen (Creator Dashboard)

**Route:** `/quiz/:quizId`
**Purpose:** Creator sees stats, leaderboard, manages quiz.

**Layout:**
```
SafeArea
└── Padding(18, top: 14)
    └── Column
        ├── TopBar: ← Back, quiz title (heading-md, truncated), ⋯ menu right
        ├── space-4
        ├── Code + Share row:
        │   ├── Code chip "Code: QZ4X9K" with copy icon
        │   ├── space-2
        │   └── Share icon button
        ├── space-5
        ├── Stats row (4 pills): Attempts | Avg Score | Time Avg | Rank
        ├── space-5
        ├── Hardest question card:
        │   - overline "HARDEST QUESTION"
        │   - body-md question text (truncated to 2 lines)
        │   - "X% got it wrong" caption
        ├── space-5
        ├── overline "LEADERBOARD"
        ├── space-2
        ├── Top 5 leaderboard rows
        ├── space-2
        ├── "See full leaderboard →" text button → /quiz/:quizId/leaderboard
        ├── space-5
        └── Danger zone (collapsed by default):
            ├── overline "QUIZ ACTIONS"
            └── List items: Edit (if no attempts), Close quiz, Delete
```

**Menu (⋯):**
- Edit (if 0 attempts)
- Duplicate (clones quiz with new code)
- Close quiz (sets status to closed)
- Delete (with confirm dialog)
- Report a problem (rare; admin contact)

**Behavior:**
- Live updates: subscribe to attempts stream, refresh stats and leaderboard in real-time
- Edit → only enabled if quiz has 0 attempts; otherwise greyed with tooltip "Can't edit after attempts"
- Close → sets `status: closed` in Firestore; attempts disabled going forward
- Delete → confirm dialog "Delete this quiz? Attempts will remain." → soft delete (status: deleted)

---

## 10. Attempt Intro Screen

**Route:** `/attempt/intro/:code`
**Purpose:** Show quiz info, optionally take name, start.

**Layout:**
```
SafeArea
└── Padding(18, top: 14)
    └── Column
        ├── TopBar: ← Back (to home)
        ├── space-5
        ├── Quiz info card:
        │   ├── Category emoji/icon top-left (big, 32pt)
        │   ├── space-2
        │   ├── heading-lg quiz title
        │   ├── space-1
        │   ├── body-sm description (truncated to 3 lines)
        │   ├── space-3
        │   └── Meta row: "N questions · 30s timer · No deadline" in body-xs
        ├── space-5
        ├── Created by row:
        │   ├── Tiny avatar
        │   ├── body-sm "Created by Aryan"
        │   └── (small text)
        ├── space-7
        ├── If name required:
        │   ├── overline "ENTER YOUR NAME"
        │   ├── space-2
        │   └── AppTextField
        ├── space-4
        ├── If quiz has deadline: deadline countdown card "Closes in 3h 24m"
        └── BottomBar: Primary Button "Start Quiz"
```

**Behavior:**
- "Start Quiz" disabled until name entered (if required)
- For anonymous: "Continue as Guest" appears as a smaller secondary action below the primary
- If logged-in: prefill name with display name, allow override
- On start: create draft attempt locally, navigate to `/attempt/quiz/:attemptId`

**Edge cases:**
- Quiz code doesn't exist → "Quiz not found" empty state + back to home
- Quiz already attempted by this device/user → bottom sheet: "You already attempted this. View result?" / "Attempt again" (if allowed)
- Quiz status `closed` or past deadline → show "This quiz is closed" with view-results link

---

## 11. Attempt Question Screen

**Route:** `/attempt/quiz/:attemptId`
**Purpose:** The actual quiz play.

**Layout:**
```
SafeArea
└── Padding(18, top: 14)
    └── Column
        ├── TopBar: ← Exit (with confirm dialog "Exit? Progress lost"), "3 of 10" (heading-sm), Timer pill right
        ├── space-3
        ├── Progress segments row (one segment per question)
        ├── space-5
        ├── Category tag chip (if quiz has category)
        ├── space-2
        ├── heading-lg question text
        ├── space-4
        ├── List of OptionTiles (4 for MCQ, 2 for T/F)
        ├── Expanded spacer
        └── BottomBar: Primary Button "Next" (or "Finish" on last question)
```

**Behavior:**
- Tap option → select. Only one selection. Re-tap deselects? NO — tapping a different option moves selection. Cannot deselect.
- Next button disabled until selection made
- If timer enabled:
  - Counts down from configured seconds
  - At 0, auto-submit current selection (or null if none) and advance
  - Pulses when ≤ 5s
- Submit logic per question:
  - Save selectedIndex + timeTakenMs to in-memory attempt
  - If reveal mode = `afterEach`: brief overlay shows correct/wrong + correct answer highlighted for 1.5s, then proceed
  - If reveal mode = `atEnd` or `none`: proceed immediately

**Exit confirm dialog:**
- Title: "Exit quiz?"
- Body: "Your progress will be lost."
- Buttons: "Stay" (primary) and "Exit" (text destructive)

**Last question "Finish":**
- Same as Next but submits the whole attempt to Firestore
- Shows a brief loading overlay ("Calculating your score…")
- Navigates to `/attempt/result/:attemptId`

**Edge cases:**
- Lost connection mid-quiz: keep going, queue submission, show toast on submit
- Backgrounded mid-question: timer pauses (use foreground state listener)
- App killed: on relaunch, check if there's an in-progress attempt and offer to resume

---

## 12. Attempt Result Screen

**Route:** `/attempt/result/:attemptId`
**Purpose:** Show score, leaderboard preview, share, challenge.

**Layout:**
```
SafeArea (no padding here — hero band edge-to-edge)
└── Column
    ├── Hero band (yellow):
    │   ├── Padding(18, top: 14, bottom: 30)
    │   ├── TopRow: ← Back + overline "YOUR RESULT" right
    │   ├── space-3
    │   ├── display-xl score "8 / 10"
    │   ├── space-1
    │   └── body-xs "Top 12% · 2m 34s · Rank #4"
    ├── Padding(18, top: 20)
    │   └── Column
    │       ├── Stat pills row: Correct | Wrong | Rank | Time
    │       ├── space-4
    │       ├── Mini-leaderboard (3-5 rows showing top + you)
    │       ├── space-3
    │       ├── "See full leaderboard →" text button
    │       ├── space-5
    │       ├── (If reveal allowed) Breakdown section:
    │       │   ├── overline "QUESTION BREAKDOWN"
    │       │   ├── space-2
    │       │   └── List of breakdown items (question + correct + your answer)
    │       ├── space-5
    │       └── BottomBar: Share | Challenge buttons (row)
```

**Behavior:**
- Hero band uses different color based on score:
  - 90%+: lime
  - 70-89%: yellow (default)
  - 50-69%: amber
  - <50%: blush
- Score animates from 0/N to final over 700ms with easeOutBack
- Stat pills stagger in
- Share button: generates share card image (via `screenshot` package), opens native share sheet with deep link
- Challenge button: creates `challenges` doc, generates Branch.io link, opens share sheet with message:
  - "I scored 8/10 on [quiz]. Beat me? quizly.link/c/abc"
- Reveal section only renders if `revealMode != none` AND (revealMode == atEnd OR all questions done)
- For `atEnd` mode with deadline: only show breakdown after deadline passes — until then, show "Results will be revealed when the quiz closes (in 3h 12m)"

---

## 13. Leaderboard Screen (Full)

**Route:** `/quiz/:quizId/leaderboard`
**Purpose:** Full sorted list of attempts.

**Layout:**
```
SafeArea
└── Padding(18, top: 14)
    └── Column
        ├── TopBar: ← Back, "Leaderboard" title centered
        ├── space-3
        ├── Quiz title + attempt count (small caption)
        ├── space-4
        ├── Expanded ListView
        │   └── Leaderboard rows (top 100)
        │       - First 3 have larger styling (slightly bigger row, accent color for rank)
        │       - "You" row highlighted
        └── If you're not in top 100: sticky "Your rank: #234" row at bottom
```

**Behavior:**
- Stream from Firestore, auto-updates
- Pull-to-refresh
- Tap a row → opens a small bottom sheet with their answers summary (only if creator viewing)

---

## 14. Challenge Intro Screen

**Route:** `/challenge/:challengeId`
**Purpose:** Entry point from a challenge deep link.

**Layout:**
```
SafeArea
└── Padding(18, top: 14)
    └── Column
        ├── space-7
        ├── Centered:
        │   ├── Big emoji ⚔️
        │   ├── space-3
        │   ├── heading-lg "Aryan challenged you"
        │   ├── space-2
        │   ├── body-md ink-3 "They scored 8/10 on '[quiz title]'. Can you beat them?"
        │   ├── space-5
        │   ├── Quiz info card (compact)
        │   └── Optional: tiny avatar + name caption
        ├── Expanded
        └── BottomBar: Primary Button "Take the Challenge"
```

**Behavior:**
- "Take the Challenge" navigates to `/attempt/intro/:code` with `challengerAttemptId` carried via state/route extra
- After completion, results screen shows a "Vs Aryan" comparison strip above the regular leaderboard
- If challenge expired (>30 days): show "This challenge expired" + view quiz button

---

## Edge Case Matrix

| Scenario | Behavior |
|---|---|
| User tries quiz code while creator deleted it | "Quiz not found" empty state |
| Network drops mid-attempt | Continue offline, queue submit |
| User force-quits during attempt | Resume prompt on next launch |
| Quiz deadline passes while user is attempting | Let them finish; submission still accepted (allow grace) |
| Two devices logged into same account, both attempting | Allowed; each attempt is unique by deviceId |
| Same device attempts same quiz twice | Allowed unless creator chose "one attempt per device" (out of MVP scope; allow multiple for now) |
| FCM permission denied | Continue without; show banner once in settings encouraging enable |
| Branch.io fails to init | Direct deep links still work via App Links / Universal Links |

---

## Accessibility Notes

- Minimum tap target: 44x44 (enforced via padding even when icon is 24x24)
- Color contrast: all text meets WCAG AA (verified per token combination)
- Screen reader labels on all interactive elements
- Avoid relying on color alone for state (e.g., selected option has both border AND filled key bubble)
- Dynamic Type: respect system font scaling up to 130%; layouts use `Flexible`/`Expanded` rather than fixed heights where possible

---

## Screen-to-Controller Mapping

| Screen | Controller |
|---|---|
| Home | `HomeController` |
| Login / Signup | `AuthFormController` |
| Create Quiz | `CreateQuizController` |
| Add Question | (sub-state of `CreateQuizController`) |
| Quiz Published | (read-only, no controller) |
| Quiz Detail | `QuizDetailController` |
| Attempt Intro / Question / Result | `AttemptController` (single controller spans flow) |
| Leaderboard | `LeaderboardController` (new — add under `leaderboard/controllers/`) |
| Challenge | `ChallengeController` |
