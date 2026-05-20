# 10 — Task Breakdown

This is the master implementation checklist. Every task is atomic, ordered, and contains exactly what to do. A coding agent should execute these in order without skipping. Each task references the relevant doc for context.

**Format per task:**
- **ID:** unique identifier
- **Title:** what to do
- **Refs:** which doc to consult
- **Dependencies:** task IDs that must be done first
- **Output:** what file(s) result
- **Acceptance:** how to verify it's done

---

## Phase 0 — Project Setup

### T0.1 Create Flutter project
- **Refs:** `07-firebase.md` § 1, `02-architecture.md`
- **Deps:** none
- **Steps:**
  1. `flutter create quizly --org com.quizly --platforms=android,ios`
  2. Set `description` and `version` in pubspec.yaml
  3. Configure `minSdkVersion 23` in `android/app/build.gradle`
  4. Configure `platform :ios, '13.0'` in `ios/Podfile`
- **Output:** initial project structure
- **Acceptance:** `flutter run` boots a blank counter app

### T0.2 Set up folder structure
- **Refs:** `02-architecture.md`
- **Deps:** T0.1
- **Steps:**
  1. Delete the default counter code from `lib/main.dart`
  2. Create the full folder tree from `02-architecture.md` under `lib/`
  3. Add a `.gitkeep` file in each empty folder for git
- **Output:** complete `lib/` skeleton
- **Acceptance:** `tree lib/` matches the architecture doc

### T0.3 Configure pubspec.yaml dependencies
- **Refs:** `07-firebase.md` § 2
- **Deps:** T0.1
- **Steps:**
  1. Copy the exact `pubspec.yaml` from `07-firebase.md` § 2
  2. Run `flutter pub get`
- **Output:** updated `pubspec.yaml`
- **Acceptance:** `flutter pub get` succeeds with no errors

### T0.4 Add Nunito and Figtree font files
- **Refs:** `04-design.md`, `07-firebase.md` § 2
- **Deps:** T0.3
- **Steps:**
  1. Create `assets/fonts/` directory
  2. Download the specified .ttf files from Google Fonts:
     - Nunito-Bold, Nunito-ExtraBold, Nunito-Black, Nunito-ExtraBoldItalic, Nunito-BlackItalic
     - Figtree-Regular, Figtree-Medium, Figtree-SemiBold, Figtree-Bold, Figtree-ExtraBold
  3. Ensure `pubspec.yaml` fonts section references them correctly
- **Output:** `assets/fonts/*.ttf`
- **Acceptance:** `flutter pub get` succeeds; fonts loadable in code

### T0.5 Configure Firebase project
- **Refs:** `07-firebase.md` §§ 1, 3, 4
- **Deps:** T0.3
- **Steps:**
  1. Create `quizly-prod` Firebase project in console
  2. Enable Auth (Google + Email), Firestore, FCM, Analytics, Crashlytics
  3. Add Android app with package `com.quizly.app`
  4. Add iOS app with bundle ID `com.quizly.app`
  5. Run `flutterfire configure --project=quizly-prod`
  6. Place `google-services.json` and `GoogleService-Info.plist` in correct dirs
  7. Add Google Services plugins to Android Gradle files
- **Output:** `lib/firebase_options.dart`, platform config files
- **Acceptance:** App launches and `Firebase.initializeApp()` completes without error

### T0.6 Set up code generation
- **Refs:** `02-architecture.md`
- **Deps:** T0.3
- **Steps:**
  1. Add `build.yaml` for build_runner config
  2. Configure analysis_options.yaml with `flutter_lints` and `riverpod_lint`
  3. Run `dart run build_runner build --delete-conflicting-outputs` to verify codegen works
- **Output:** `build.yaml`, `analysis_options.yaml`
- **Acceptance:** Codegen runs without errors

---

## Phase 1 — Core Foundations

### T1.1 Create design tokens
- **Refs:** `04-design.md`
- **Deps:** T0.2
- **Steps:**
  1. Create `lib/core/theme/app_colors.dart` with all color tokens for light + dark
  2. Create `lib/core/theme/app_text_styles.dart` with all type-scale tokens
  3. Create `lib/core/theme/tokens.dart` with Spacing, Radius, Shadows constants
  4. Create `lib/core/theme/app_theme.dart` with `ThemeData light()` and `ThemeData dark()` using `ThemeExtension<AppColors>`
- **Output:** files in `lib/core/theme/`
- **Acceptance:** A test widget that displays `Theme.of(context).extension<AppColors>()!.orange` renders the correct color

### T1.2 Create context extensions
- **Refs:** `02-architecture.md`, `04-design.md`
- **Deps:** T1.1
- **Steps:**
  1. Create `lib/core/extensions/context_extensions.dart` with `context.colors`, `context.text`
  2. Create `lib/core/extensions/string_extensions.dart`, `duration_extensions.dart`
- **Output:** extension files
- **Acceptance:** `context.colors.orange` resolves correctly in widget builds

### T1.3 Create core constants and utilities
- **Refs:** `06-features.md` § 2, `02-architecture.md`
- **Deps:** T0.2
- **Steps:**
  1. Create `lib/core/constants/app_constants.dart` (code length, charset, etc.)
  2. Create `lib/core/constants/env.dart` (Branch keys placeholder)
  3. Create `lib/core/utils/code_generator.dart` (per features doc § 2.2)
  4. Create `lib/core/utils/code_formatter.dart` (input formatter)
  5. Create `lib/core/utils/time_formatter.dart` (mm:ss, relative time)
  6. Create `lib/core/utils/validators.dart` (email, password)
  7. Create `lib/core/utils/result_calculator.dart`
- **Output:** utility files
- **Acceptance:** Unit tests pass for code generation (uniqueness, length, charset)

### T1.4 Create error handling
- **Refs:** `02-architecture.md`
- **Deps:** T0.2
- **Steps:**
  1. Create `lib/core/errors/app_exception.dart` (sealed class hierarchy)
  2. Create `lib/core/errors/failure.dart` (Result<T> with Success/Failure)
  3. Create `lib/core/errors/error_messages.dart` (user-facing strings)
- **Output:** error files
- **Acceptance:** Can instantiate and catch typed errors

### T1.5 Initialize Hive
- **Refs:** `07-firebase.md` § 5.2, `03-database.md`
- **Deps:** T0.3
- **Steps:**
  1. Create `lib/data/sources/local/hive_init.dart` exactly as spec
  2. Create thin wrappers `local_user_source.dart`, `local_quiz_source.dart`, `local_attempt_source.dart`
- **Output:** Hive init code + sources
- **Acceptance:** Hive boxes open at app start; device_id persists across launches

### T1.6 Create main.dart and app.dart
- **Refs:** `07-firebase.md` § 5.1
- **Deps:** T1.1, T1.5, T0.5
- **Steps:**
  1. Create `lib/main.dart` with Firebase init, Crashlytics setup, Hive init, then runApp
  2. Create `lib/app.dart` as a `ConsumerWidget` that builds `MaterialApp.router` with theme + go_router config
  3. Stub router with placeholder routes for now
- **Output:** `main.dart`, `app.dart`
- **Acceptance:** App launches to a placeholder home screen

---

## Phase 2 — Domain Models

### T2.1 Create domain enums
- **Refs:** `02-architecture.md`, `03-database.md`
- **Deps:** T0.2
- **Steps:**
  1. Create `question_type.dart` (mcq, trueFalse)
  2. Create `reveal_mode.dart` (afterEach, atEnd, none)
  3. Create `quiz_status.dart` (live, closed, draft, deleted)
  4. Create `auth_status.dart`
  5. Create `attempt_status.dart` (inProgress, submitted, abandoned)
- **Output:** enum files in `lib/domain/enums/`
- **Acceptance:** Enums compile and have `fromString`/`toString` for Firestore serialization

### T2.2 Create domain models with freezed
- **Refs:** `03-database.md`
- **Deps:** T2.1, T0.6
- **Steps:**
  1. Create `app_user.dart` (uid, email, displayName, photoUrl, createdAt, etc.)
  2. Create `quiz.dart` with nested `QuizSettings`, `QuizStats`
  3. Create `question.dart`
  4. Create `attempt.dart` with nested `Answer`, `Score`
  5. Create `leaderboard_entry.dart`
  6. Create `challenge.dart`
  7. Run `dart run build_runner build` to generate freezed files
- **Output:** model files + `.freezed.dart` + `.g.dart`
- **Acceptance:** All models compile; `toJson`/`fromJson` work for sample data

### T2.3 Create DTOs for Firestore conversion
- **Refs:** `02-architecture.md` § Folder Structure
- **Deps:** T2.2
- **Steps:**
  1. Create `quiz_dto.dart` with `Quiz.fromFirestore(DocumentSnapshot)` and `toFirestore()`
  2. Create `attempt_dto.dart` with same pattern
  3. Create `user_dto.dart` with same pattern
- **Output:** DTO files in `lib/data/dtos/`
- **Acceptance:** Round-trip Quiz → Firestore map → Quiz produces equal objects

---

## Phase 3 — Data Layer

### T3.1 Implement FirestoreQuizSource
- **Refs:** `03-database.md`
- **Deps:** T2.3
- **Steps:**
  1. Create `firestore_quiz_source.dart`
  2. Methods: `createQuiz`, `updateQuiz`, `deleteQuiz`, `getQuizById`, `getQuizByCode`, `getCreatorQuizzes`, `getQuestions(quizId)`, `codeExists(code)`
  3. Use batch writes where multiple docs are involved
- **Output:** `firestore_quiz_source.dart`
- **Acceptance:** Unit-test against Firebase emulator: create a quiz, retrieve it by code, verify questions present

### T3.2 Implement FirestoreAttemptSource
- **Refs:** `03-database.md`, `06-features.md` § 4
- **Deps:** T2.3
- **Steps:**
  1. Create `firestore_attempt_source.dart`
  2. Methods: `createAttempt`, `updateAttempt`, `submitAttempt`, `getAttemptById`, `getAttemptsByQuiz`, `getAttemptsByUser`, `getAttemptsByDevice`, `getLeaderboardStream(quizId)`, `getRankAbove(quizId, percentage)`
  3. Implement composite query for leaderboard with tie-breakers
- **Output:** `firestore_attempt_source.dart`
- **Acceptance:** Leaderboard query returns correctly ordered results

### T3.3 Implement FirestoreUserSource
- **Refs:** `03-database.md`
- **Deps:** T2.3
- **Steps:**
  1. Create `firestore_user_source.dart`
  2. Methods: `createUser`, `updateUser`, `getUserById`, `updateLastSeen`, `updatePreferences`
- **Output:** `firestore_user_source.dart`
- **Acceptance:** Can create + retrieve a user doc

### T3.4 Implement FirebaseAuthSource
- **Refs:** `06-features.md` § 1
- **Deps:** T2.2
- **Steps:**
  1. Create `firebase_auth_source.dart`
  2. Methods: `signInWithGoogle`, `signInWithEmail`, `signUpWithEmail`, `signOut`, `sendPasswordResetEmail`, `currentUser`, `authStateChanges()`
- **Output:** `firebase_auth_source.dart`
- **Acceptance:** Sign in/out works in a debug build

### T3.5 Implement FcmSource
- **Refs:** `09-notifications.md` § 2
- **Deps:** T3.3
- **Steps:**
  1. Create `fcm_source.dart` per spec
  2. Add the top-level background handler function
  3. Register background handler in `main.dart`
- **Output:** `fcm_source.dart`
- **Acceptance:** FCM token logged on app start

### T3.6 Implement BranchSource (DeeplinkRepository)
- **Refs:** `08-deeplinks.md` § 7
- **Deps:** T2.2
- **Steps:**
  1. Create `branch_source.dart`
  2. Initialize Branch on app start
  3. Listen to incoming sessions and emit typed `DeeplinkData` events
  4. Method to generate short URLs
- **Output:** `branch_source.dart`
- **Acceptance:** Test link click in dev opens app and emits correct event

### T3.7 Implement repositories
- **Refs:** `02-architecture.md` § Data Flow
- **Deps:** T3.1-T3.6
- **Steps:**
  1. Create `auth_repository.dart` wrapping FirebaseAuthSource + handling sign-in side-effects (create user doc, run migration)
  2. Create `quiz_repository.dart` wrapping FirestoreQuizSource + LocalQuizSource (with cache-first reads)
  3. Create `attempt_repository.dart` wrapping FirestoreAttemptSource + LocalAttemptSource + pending queue
  4. Create `user_repository.dart`
  5. Create `notification_repository.dart` wrapping FcmSource + LocalNotificationsService
  6. Create `deeplink_repository.dart` wrapping BranchSource
- **Output:** repository files
- **Acceptance:** Each repository exposes a clean API used by controllers; sources are not directly accessed elsewhere

### T3.8 Implement use cases
- **Refs:** `02-architecture.md`, `06-features.md`
- **Deps:** T3.7
- **Steps:**
  1. `create_quiz_usecase.dart` — validates draft, generates unique code, writes via repo
  2. `submit_attempt_usecase.dart` — computes score, rank, updates quiz stats
  3. `compute_leaderboard_usecase.dart` — fetches + ranks
  4. `migrate_guest_attempts_usecase.dart` — per `06-features.md` § 11
  5. `generate_share_card_usecase.dart` — uses screenshot package
- **Output:** use case files
- **Acceptance:** Each use case has unit tests covering happy path + key edge cases

---

## Phase 4 — Riverpod Providers

### T4.1 Set up repository providers
- **Refs:** `02-architecture.md` § State Management
- **Deps:** T3.7
- **Steps:**
  1. Create `@Riverpod(keepAlive: true)` providers for each repository and source
  2. Wire dependencies: e.g., `quizRepositoryProvider` depends on `firestoreQuizSourceProvider` + `localQuizSourceProvider`
- **Output:** generated provider code
- **Acceptance:** `dart run build_runner build` generates without errors

### T4.2 Set up auth state stream provider
- **Refs:** `06-features.md` § 1.1
- **Deps:** T4.1
- **Steps:**
  1. Create `auth_controller.dart` with `authStateChanges` provider that emits `AuthState`
  2. Combine Firebase Auth stream with deviceId to produce `AuthAuthenticated | AuthGuest | AuthSignedOut`
- **Output:** auth controller
- **Acceptance:** Subscribing to the stream emits correct values for various scenarios

### T4.3 Set up theme controller
- **Refs:** `04-design.md`
- **Deps:** T1.5
- **Steps:**
  1. Create `theme_controller.dart` with `ThemeMode` state persisted in Hive
- **Output:** theme controller
- **Acceptance:** Toggle works; persists across launches

### T4.4 Set up connectivity controller
- **Refs:** `02-architecture.md` § Offline Handling
- **Deps:** T0.3
- **Steps:**
  1. Create `connectivity_controller.dart` exposing online/offline state from `connectivity_plus`
  2. Trigger pending submission flush on transition to online
- **Output:** connectivity controller
- **Acceptance:** State updates correctly when toggling airplane mode

---

## Phase 5 — Shared Widgets

> Build all shared widgets BEFORE building screens. This guarantees screens are pure compositions.

### T5.1 Build PrimaryButton + SecondaryButton + TextButtonLink
- **Refs:** `04-design.md` § Buttons
- **Deps:** T1.1, T1.2
- **Steps:**
  1. `primary_button.dart` with label, icon (optional), onPressed, loading state
  2. `secondary_button.dart` with same API
  3. `text_button_link.dart` minimal
- **Output:** widgets
- **Acceptance:** Visual matches design preview; tap-down scales to 0.97

### T5.2 Build AppTextField + CodeInputField
- **Refs:** `04-design.md` § Inputs
- **Deps:** T1.1
- **Steps:**
  1. `app_text_field.dart` with label, hint, error, multiline support
  2. `code_input_field.dart` — special 6-char with letter-spacing, auto-uppercase
- **Output:** widgets
- **Acceptance:** Code field shows wide-gap chars; rejects non-charset input

### T5.3 Build TagChip + Badge
- **Refs:** `04-design.md` § Tags
- **Deps:** T1.1
- **Steps:**
  1. `tag_chip.dart` with color variant prop (live, closed, category, etc.)
- **Output:** widget
- **Acceptance:** Visual matches preview

### T5.4 Build QuizCard
- **Refs:** `04-design.md` § Cards, `05-screens.md` § 5
- **Deps:** T5.3
- **Steps:**
  1. `quiz_card.dart` with icon, title, meta row, badge
  2. Long-press triggers callback for the action sheet
- **Output:** widget
- **Acceptance:** Renders given a Quiz model

### T5.5 Build StatPill + LeaderboardRow
- **Refs:** `04-design.md`, `05-screens.md` §§ 12, 13
- **Deps:** T1.1
- **Steps:**
  1. `stat_pill.dart`
  2. `leaderboard_row.dart` with rank, avatar, name, score, "you" highlight variant
- **Output:** widgets
- **Acceptance:** Visual matches preview

### T5.6 Build ProgressSegments + TimerPill
- **Refs:** `04-design.md`
- **Deps:** T1.1
- **Steps:**
  1. `progress_segments.dart` with done/current/pending states
  2. `timer_pill.dart` with pulse animation when ≤ 5s
- **Output:** widgets
- **Acceptance:** Animations smooth at 60fps

### T5.7 Build OptionTile
- **Refs:** `04-design.md` § Components
- **Deps:** T1.1
- **Steps:**
  1. `option_tile.dart` with letter bubble + label + selected state
- **Output:** widget
- **Acceptance:** Selected state shows orange border + filled key

### T5.8 Build EmptyState + LoadingView + ErrorView
- **Refs:** `04-design.md` §§ Empty/Loading/Error
- **Deps:** T1.1
- **Steps:**
  1. `empty_state.dart` with optional emoji, title, description, action
  2. `loading_view.dart` minimal centered spinner
  3. `error_view.dart` with retry callback
- **Output:** widgets
- **Acceptance:** All three render given props

### T5.9 Build ConfirmDialog + BottomSheet patterns
- **Refs:** `04-design.md` § Dialog
- **Deps:** T5.1
- **Steps:**
  1. `confirm_dialog.dart` reusable `showConfirmDialog(...)` helper
  2. `app_bottom_sheet.dart` wrapper that applies the design tokens
- **Output:** helpers
- **Acceptance:** Both render with proper padding, radius

---

## Phase 6 — Router

### T6.1 Implement GoRouter config
- **Refs:** `02-architecture.md` § Navigation
- **Deps:** T4.2, T3.6
- **Steps:**
  1. Create `lib/core/router/route_names.dart` with route path constants
  2. Create `lib/core/router/app_router.dart` with all routes, redirect logic, deep link refresh listener
  3. Wire into `app.dart`
- **Output:** router files
- **Acceptance:** Navigation between placeholder screens works; deep link listener triggers route changes

---

## Phase 7 — Auth Screens

### T7.1 Build SplashScreen
- **Refs:** `05-screens.md` § 1
- **Deps:** T6.1, T4.2
- **Steps:**
  1. Create `splash_screen.dart`
  2. Initialize services, check auth, route accordingly
- **Output:** screen
- **Acceptance:** App routes correctly based on first launch / auth state

### T7.2 Build LoginScreen + SignupScreen
- **Refs:** `05-screens.md` §§ 3, 4
- **Deps:** T5.1, T5.2, T4.2
- **Steps:**
  1. Create `login_screen.dart` and `signup_screen.dart`
  2. Wire `AuthFormController` to call repo
  3. Handle errors with inline messages and snackbars
- **Output:** screens
- **Acceptance:** Can sign up, sign in via Google + email; appropriate redirects

### T7.3 Build OnboardingScreen (3-slide intro)
- **Refs:** `05-screens.md` § 2
- **Deps:** T5.1
- **Steps:**
  1. Create `onboarding_screen.dart` with PageView + indicator dots
  2. Persist `has_seen_onboarding` flag in Hive on completion
- **Output:** screen
- **Acceptance:** First launch shows onboarding; subsequent don't

---

## Phase 8 — Home + Code Entry

### T8.1 Build HomeScreen scaffold
- **Refs:** `05-screens.md` § 5
- **Deps:** T5.4, T5.1
- **Steps:**
  1. Create `home_screen.dart` with header, code card placeholder, tabs, list, footer
  2. Wire `HomeController` to fetch created and attempted quizzes
- **Output:** screen + controller
- **Acceptance:** Renders empty states + populated states correctly

### T8.2 Build CodeEntryCard interaction
- **Refs:** `05-screens.md` § 5, `06-features.md` § 2.4
- **Deps:** T8.1, T5.2
- **Steps:**
  1. Tapping card opens focused input (bottom sheet or expanded inline)
  2. On 6-char input, validate against Firestore via repo
  3. On valid: navigate to `/attempt/intro/:code`
  4. On invalid: shake + error message
- **Output:** widget interaction
- **Acceptance:** Valid code routes correctly; invalid shows error

### T8.3 Implement long-press actions on quiz cards
- **Refs:** `05-screens.md` § 5
- **Deps:** T8.1, T5.9
- **Steps:**
  1. Long-press shows bottom sheet with Edit / Delete / Copy code / Share
  2. Each action wired to repo + router
- **Output:** interactions
- **Acceptance:** All four actions work; delete shows confirm

---

## Phase 9 — Create Quiz Flow

### T9.1 Build CreateQuizScreen scaffold
- **Refs:** `05-screens.md` § 6, `06-features.md` § 3
- **Deps:** T5.1, T5.2
- **Steps:**
  1. Create `create_quiz_screen.dart` with all sections
  2. Wire `CreateQuizController` that holds draft state in memory
  3. Auto-save to Hive every 5 seconds
- **Output:** screen + controller
- **Acceptance:** All inputs render and update state

### T9.2 Build settings widgets
- **Refs:** `05-screens.md` § 6
- **Deps:** T9.1
- **Steps:**
  1. `anonymous_toggle.dart` — switch widget
  2. `reveal_mode_picker.dart` — 3 chips, single-select
  3. `timer_picker.dart` — chip row + custom modal
  4. `deadline_picker.dart` — chip row + date/time picker modal
- **Output:** widgets
- **Acceptance:** Each updates the controller correctly

### T9.3 Build AddQuestionScreen
- **Refs:** `05-screens.md` § 7
- **Deps:** T5.1, T5.2, T5.7
- **Steps:**
  1. Create `add_question_screen.dart`
  2. Question type segmented control
  3. Question text input
  4. Option inputs with mark-correct radios
  5. Optional explanation input
  6. Save adds to controller's question list
- **Output:** screen
- **Acceptance:** Can add and edit questions; validation works

### T9.4 Implement publish flow
- **Refs:** `06-features.md` § 3.3
- **Deps:** T9.1, T3.8
- **Steps:**
  1. On publish button, validate full draft
  2. Call `CreateQuizUseCase`
  3. On success: navigate to `/quiz/published/:quizId`
  4. On failure: snackbar with retry
- **Output:** publish action
- **Acceptance:** Publishing creates a Firestore doc + questions; code is unique

### T9.5 Build QuizPublishedScreen
- **Refs:** `05-screens.md` § 8
- **Deps:** T5.1, T3.6
- **Steps:**
  1. Create `quiz_published_screen.dart`
  2. Display code prominently, tap-to-copy
  3. Generate Branch.io link, show truncated, tap-to-copy
  4. Share button opens native share sheet
- **Output:** screen
- **Acceptance:** Code displays correctly; copy + share work

---

## Phase 10 — Quiz Attempt Flow

### T10.1 Build AttemptIntroScreen
- **Refs:** `05-screens.md` § 10
- **Deps:** T5.1, T5.2
- **Steps:**
  1. Create `attempt_intro_screen.dart`
  2. Fetch quiz by code/id via repo
  3. Show quiz info; conditionally show name input
  4. Handle closed / not-found / past-deadline states
- **Output:** screen
- **Acceptance:** All states render correctly

### T10.2 Build AttemptQuestionScreen
- **Refs:** `05-screens.md` § 11, `06-features.md` § 4
- **Deps:** T5.6, T5.7
- **Steps:**
  1. Create `attempt_question_screen.dart`
  2. Wire `AttemptController` to manage current question index, selection, timer
  3. Implement timer logic with foreground pause/resume
  4. Implement reveal-after-each overlay if applicable
  5. Submit per-answer via controller
- **Output:** screen + controller
- **Acceptance:** Full quiz playthrough works; timer behaves correctly; answers persist

### T10.3 Build AttemptResultScreen
- **Refs:** `05-screens.md` § 12, `06-features.md` § 4.5
- **Deps:** T5.5
- **Steps:**
  1. Create `attempt_result_screen.dart`
  2. Animated score reveal
  3. Stat pills with staggered entry
  4. Mini-leaderboard widget
  5. Conditional breakdown section based on reveal mode + deadline
  6. Share + Challenge buttons
- **Output:** screen
- **Acceptance:** Animations smooth; all sections respect reveal mode

### T10.4 Implement Share + Challenge
- **Refs:** `06-features.md` §§ 9, 10
- **Deps:** T10.3, T3.8
- **Steps:**
  1. Share: screenshot card → share sheet with image + text + link
  2. Challenge: create challenge doc → generate Branch link → share
- **Output:** share + challenge handlers
- **Acceptance:** Both produce working links; recipient can open them

### T10.5 Implement resume interrupted attempt
- **Refs:** `06-features.md` § 4.7
- **Deps:** T10.2
- **Steps:**
  1. On home mount, check for in_progress attempt in Hive
  2. Show bottom sheet to resume or discard
  3. Resume restores attempt state and routes back into question screen
- **Output:** logic
- **Acceptance:** Force-quit during attempt + relaunch shows resume prompt

---

## Phase 11 — Leaderboard + Creator Dashboard

### T11.1 Build LeaderboardScreen
- **Refs:** `05-screens.md` § 13, `06-features.md` § 6
- **Deps:** T5.5
- **Steps:**
  1. Create `leaderboard_screen.dart` with live-streaming list
  2. Sticky "your rank" footer if outside top 100
- **Output:** screen
- **Acceptance:** Live updates; pull-to-refresh works

### T11.2 Build QuizDetailScreen
- **Refs:** `05-screens.md` § 9
- **Deps:** T5.5
- **Steps:**
  1. Create `quiz_detail_screen.dart`
  2. Show stats, hardest question card, mini-leaderboard
  3. Menu actions (edit, duplicate, close, delete)
- **Output:** screen
- **Acceptance:** All sections render; menu actions work

---

## Phase 12 — Challenge Flow

### T12.1 Build ChallengeIntroScreen
- **Refs:** `05-screens.md` § 14
- **Deps:** T5.1, T3.6
- **Steps:**
  1. Create `challenge_intro_screen.dart`
  2. Fetch challenge by id
  3. Show challenger info + quiz info
  4. "Take the Challenge" → routes to attempt with challenger context
- **Output:** screen
- **Acceptance:** Opens from deep link; handles expired challenges

### T12.2 Implement Vs comparison on results
- **Refs:** `06-features.md` § 10.3
- **Deps:** T10.3, T12.1
- **Steps:**
  1. If attempt has challengerAttemptId, show comparison strip above leaderboard
- **Output:** comparison widget
- **Acceptance:** Renders correctly with two scores

---

## Phase 13 — Notifications

### T13.1 Implement LocalNotificationsService
- **Refs:** `09-notifications.md` § 5
- **Deps:** T0.3
- **Steps:**
  1. Create `local_notifications_service.dart` per spec
  2. Initialize in app start
  3. Schedule deadline reminder + reveal notifications
- **Output:** service
- **Acceptance:** Notifications fire at scheduled times

### T13.2 Wire FCM handlers
- **Refs:** `09-notifications.md` §§ 6, 7
- **Deps:** T3.5, T6.1
- **Steps:**
  1. Foreground handler shows custom in-app banner
  2. Background → foreground handler routes via router
  3. Cold-start `getInitialMessage` routes appropriately
- **Output:** handlers
- **Acceptance:** Test FCM messages route to correct screens

### T13.3 Permission prompt UX
- **Refs:** `09-notifications.md` § 7
- **Deps:** T5.9
- **Steps:**
  1. Soft prompt UI after first quiz interaction
  2. Don't show immediately on first launch
- **Output:** prompt dialog
- **Acceptance:** Prompt only shows once

---

## Phase 14 — Guest Migration

### T14.1 Implement migration use case
- **Refs:** `06-features.md` § 11, `03-database.md` § Data Migration
- **Deps:** T3.7
- **Steps:**
  1. `MigrateGuestAttemptsUseCase` per spec
  2. Run on every login/signup completion in `AuthRepository`
- **Output:** use case wired
- **Acceptance:** Logging into a fresh account after attempting as guest preserves attempts

### T14.2 Add migration snackbar
- **Refs:** `06-features.md` § 11.3
- **Deps:** T14.1
- **Steps:**
  1. After successful migration with >0 migrated, show home snackbar
- **Output:** UI feedback
- **Acceptance:** Snackbar appears once

---

## Phase 15 — Offline & Pending Submissions

### T15.1 Implement pending submissions queue
- **Refs:** `06-features.md` § 13, `02-architecture.md`
- **Deps:** T3.7
- **Steps:**
  1. Hive `pending_submissions` box
  2. Wrap attempt-submit in repository to queue on failure
  3. Background flush triggered by `ConnectivityController`
- **Output:** queue logic
- **Acceptance:** Offline submission queues; reconnecting flushes

### T15.2 Show offline banner
- **Refs:** `05-screens.md` § Home
- **Deps:** T15.1
- **Steps:**
  1. Home screen displays small "Offline" banner when disconnected
- **Output:** banner
- **Acceptance:** Toggling airplane mode shows/hides banner

---

## Phase 16 — Reporting

### T16.1 Implement report flow
- **Refs:** `06-features.md` § 12, `05-screens.md` § 9
- **Deps:** T5.9
- **Steps:**
  1. Report option in quiz menu
  2. Bottom sheet with reason chips + optional details
  3. Write to `/reports` collection
- **Output:** report UI + write
- **Acceptance:** Submitted report appears in Firestore

---

## Phase 17 — Polish

### T17.1 Add page transitions
- **Refs:** `04-design.md` § Motion
- **Deps:** T6.1
- **Steps:**
  1. Configure GoRouter transitions per design spec
  2. Custom builders for slide / fade
- **Output:** transitions
- **Acceptance:** Smooth, consistent transitions

### T17.2 Add haptic feedback
- **Refs:** `04-design.md`
- **Deps:** all screens
- **Steps:**
  1. Light haptic on button taps, selection, copy
  2. Medium haptic on celebratory moments (correct answer in afterEach mode)
- **Output:** haptic calls
- **Acceptance:** Feels right on a physical device

### T17.3 Add splash + app icons
- **Refs:** —
- **Deps:** T0.5
- **Steps:**
  1. Design 1024x1024 icon
  2. Use `flutter_launcher_icons` to generate
  3. Use `flutter_native_splash` for splash
- **Output:** icon and splash assets
- **Acceptance:** App icon + splash visible on install

### T17.4 Dark mode pass
- **Refs:** `04-design.md` § Light vs Dark
- **Deps:** all screens
- **Steps:**
  1. Visit every screen in dark mode
  2. Fix any inconsistencies
- **Output:** dark mode fixes
- **Acceptance:** Every screen looks intentional in both modes

### T17.5 Accessibility pass
- **Refs:** `05-screens.md` § Accessibility
- **Deps:** all screens
- **Steps:**
  1. Verify all interactive elements have semantic labels
  2. Test with screen reader (TalkBack / VoiceOver)
  3. Test with font scaling 130%
- **Output:** a11y fixes
- **Acceptance:** App is usable with screen reader

---

## Phase 18 — Testing

### T18.1 Unit tests for core utilities
- **Refs:** `06-features.md`
- **Deps:** T1.3, T3.8
- **Steps:**
  1. Tests for `code_generator`, `result_calculator`, `time_formatter`, `validators`
  2. Tests for each use case (happy path + edge)
- **Output:** test files
- **Acceptance:** Coverage > 80% on `core/utils/` and `domain/usecases/`

### T18.2 Widget tests for shared components
- **Refs:** `04-design.md`
- **Deps:** T5.x
- **Steps:**
  1. Render tests for each shared widget
  2. Tap interaction tests
- **Output:** widget tests
- **Acceptance:** Tests pass; key visuals snapshotted

### T18.3 Integration tests for critical flows
- **Refs:** `05-screens.md`
- **Deps:** all phases above
- **Steps:**
  1. Sign in → create quiz → publish (full flow)
  2. Enter code → attempt → result (full flow)
  3. Guest attempt → sign up → migration happens
- **Output:** integration tests
- **Acceptance:** All three pass on Firebase emulator

---

## Phase 19 — Deploy

### T19.1 Deploy Firestore rules + indexes
- **Refs:** `07-firebase.md` § 8
- **Deps:** T0.5
- **Steps:**
  1. `firebase deploy --only firestore:rules`
  2. `firebase deploy --only firestore:indexes`
- **Output:** deployed config
- **Acceptance:** Rules + indexes visible in Firebase Console

### T19.2 Beta build (internal testing)
- **Refs:** `07-firebase.md` § 9
- **Deps:** all
- **Steps:**
  1. Generate signed Android `app-release.aab`
  2. Upload to Play Console Internal Testing track
  3. Generate iOS IPA, upload to TestFlight
- **Output:** beta builds
- **Acceptance:** Test users can install via TestFlight / Play Internal

### T19.3 Production release
- **Refs:** —
- **Deps:** T19.2
- **Steps:**
  1. After beta sign-off, promote to production tracks
  2. Set up store listings (descriptions, screenshots)
- **Output:** live on Play Store + App Store
- **Acceptance:** Apps live

---

## Execution Order Summary

```
0 → 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8 → 9 → 10 → 11 → 12 → 13 → 14 → 15 → 16 → 17 → 18 → 19
```

Phases 5 (widgets) and 6 (router) can overlap. Phases 11 and 12 can be done in parallel after 10. Phase 17 (polish) is interleaved with phase 18 (testing) at the end.

**Estimated effort for a single coding agent working sequentially:** ~60-80 atomic tasks, each ~30-90 minutes. Roughly 2-3 working weeks of focused execution.

---

## How to Use This Document

For a coding agent like Haiku:
1. Read all 10 docs first (in order: overview → architecture → database → design → screens → features → firebase → deeplinks → notifications → tasks).
2. Begin with T0.1 and proceed sequentially.
3. For each task: read the relevant section of the referenced doc, then implement.
4. Run `dart run build_runner build --delete-conflicting-outputs` after any model or provider changes.
5. Commit after each task with the task ID in the commit message (e.g., `T9.4: implement quiz publish flow`).
6. If a task is ambiguous, default to the design doc (`04-design.md`) for visual decisions and the architecture doc (`02-architecture.md`) for code structure.
