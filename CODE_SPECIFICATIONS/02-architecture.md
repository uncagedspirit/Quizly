# 02 — Architecture

This document defines the project structure, layering, state management, and data flow. Every file in the codebase belongs to one of these layers. No exceptions.

---

## High-Level Architecture

```
┌──────────────────────────────────────┐
│     PRESENTATION (Widgets/Screens)   │  ← Flutter UI, Riverpod consumers
├──────────────────────────────────────┤
│     APPLICATION (Controllers)        │  ← Riverpod Notifiers, business orchestration
├──────────────────────────────────────┤
│     DOMAIN (Models + Use Cases)      │  ← Pure Dart, no Flutter or Firebase imports
├──────────────────────────────────────┤
│     DATA (Repositories + Sources)    │  ← Firestore, Hive, Branch.io, FCM, Auth
└──────────────────────────────────────┘
```

**Rules:**
- Each layer depends only on the layers below it.
- The Domain layer has zero external imports — pure Dart only.
- UI never talks to Firebase directly. Always goes through a repository.
- Controllers are the only place where business logic lives.

---

## Folder Structure

```
lib/
├── main.dart                          # entrypoint, Firebase init, app boot
├── app.dart                           # MaterialApp config, theme, router
│
├── core/
│   ├── theme/
│   │   ├── app_colors.dart            # color tokens (cream, blush, etc.)
│   │   ├── app_text_styles.dart       # typography tokens
│   │   ├── app_spacing.dart           # spacing scale
│   │   ├── app_radius.dart            # border radius scale
│   │   ├── app_shadows.dart           # shadow tokens
│   │   └── app_theme.dart             # ThemeData light + dark
│   ├── router/
│   │   ├── app_router.dart            # GoRouter config
│   │   └── route_names.dart           # constants for all routes
│   ├── constants/
│   │   ├── app_constants.dart         # global constants (code length, etc.)
│   │   └── env.dart                   # env config (Branch key, etc.)
│   ├── utils/
│   │   ├── code_generator.dart        # 6-char quiz code generator
│   │   ├── code_formatter.dart        # input formatter for code field
│   │   ├── time_formatter.dart        # "2m 34s", "in 3 hours", etc.
│   │   ├── result_calculator.dart     # score, percentile, rank logic
│   │   └── validators.dart            # email, password, quiz title validators
│   ├── extensions/
│   │   ├── context_extensions.dart    # context.colors, context.text
│   │   ├── string_extensions.dart     # .truncate, .capitalize
│   │   └── duration_extensions.dart   # .mmss formatter
│   └── errors/
│       ├── app_exception.dart         # base exception
│       ├── failure.dart               # Failure sealed class
│       └── error_messages.dart        # user-facing error strings
│
├── domain/
│   ├── models/
│   │   ├── user_model.dart            # AppUser
│   │   ├── quiz_model.dart            # Quiz
│   │   ├── question_model.dart        # Question
│   │   ├── attempt_model.dart         # Attempt
│   │   ├── answer_model.dart          # Answer (sub-model)
│   │   ├── leaderboard_entry_model.dart
│   │   └── challenge_model.dart       # Challenge
│   ├── enums/
│   │   ├── question_type.dart         # mcq, trueFalse
│   │   ├── reveal_mode.dart           # afterEach, atEnd, none
│   │   ├── quiz_status.dart           # live, closed, draft
│   │   └── auth_status.dart           # authenticated, guest, signedOut
│   └── usecases/
│       ├── create_quiz_usecase.dart
│       ├── submit_attempt_usecase.dart
│       ├── compute_leaderboard_usecase.dart
│       ├── migrate_guest_attempts_usecase.dart
│       └── generate_share_card_usecase.dart
│
├── data/
│   ├── sources/
│   │   ├── remote/
│   │   │   ├── firebase_auth_source.dart
│   │   │   ├── firestore_quiz_source.dart
│   │   │   ├── firestore_attempt_source.dart
│   │   │   ├── firestore_user_source.dart
│   │   │   ├── fcm_source.dart                # token mgmt, foreground/bg handlers
│   │   │   └── branch_source.dart             # deep link create + listen
│   │   └── local/
│   │       ├── hive_init.dart                 # box registration
│   │       ├── local_user_source.dart         # guest profile, FCM token
│   │       ├── local_quiz_source.dart         # cached quizzes for offline
│   │       └── local_attempt_source.dart      # guest attempts before signup
│   ├── repositories/
│   │   ├── auth_repository.dart
│   │   ├── quiz_repository.dart
│   │   ├── attempt_repository.dart
│   │   ├── user_repository.dart
│   │   ├── notification_repository.dart
│   │   └── deeplink_repository.dart
│   └── dtos/
│       ├── quiz_dto.dart                      # Firestore <-> Quiz model
│       ├── attempt_dto.dart
│       └── user_dto.dart
│
├── presentation/
│   ├── shared/
│   │   ├── widgets/
│   │   │   ├── primary_button.dart
│   │   │   ├── secondary_button.dart
│   │   │   ├── text_button_link.dart
│   │   │   ├── app_text_field.dart
│   │   │   ├── code_input_field.dart
│   │   │   ├── tag_chip.dart
│   │   │   ├── quiz_card.dart
│   │   │   ├── stat_pill.dart
│   │   │   ├── leaderboard_row.dart
│   │   │   ├── progress_segments.dart
│   │   │   ├── timer_pill.dart
│   │   │   ├── option_tile.dart
│   │   │   ├── empty_state.dart
│   │   │   ├── loading_view.dart
│   │   │   ├── error_view.dart
│   │   │   └── confirm_dialog.dart
│   │   └── controllers/
│   │       ├── auth_controller.dart           # current user stream
│   │       ├── connectivity_controller.dart
│   │       └── theme_controller.dart          # light/dark switching
│   │
│   ├── auth/
│   │   ├── screens/
│   │   │   ├── login_screen.dart
│   │   │   ├── signup_screen.dart
│   │   │   └── splash_screen.dart
│   │   └── controllers/
│   │       └── auth_form_controller.dart
│   │
│   ├── home/
│   │   ├── screens/
│   │   │   └── home_screen.dart
│   │   ├── widgets/
│   │   │   ├── home_header.dart
│   │   │   ├── code_entry_card.dart
│   │   │   ├── tab_switcher.dart
│   │   │   └── new_quiz_footer.dart
│   │   └── controllers/
│   │       └── home_controller.dart
│   │
│   ├── create_quiz/
│   │   ├── screens/
│   │   │   ├── create_quiz_screen.dart
│   │   │   ├── add_question_screen.dart
│   │   │   └── quiz_published_screen.dart
│   │   ├── widgets/
│   │   │   ├── quiz_title_field.dart
│   │   │   ├── anonymous_toggle.dart
│   │   │   ├── reveal_mode_picker.dart
│   │   │   ├── timer_picker.dart
│   │   │   ├── deadline_picker.dart
│   │   │   ├── question_pill.dart
│   │   │   └── add_question_button.dart
│   │   └── controllers/
│   │       └── create_quiz_controller.dart
│   │
│   ├── attempt/
│   │   ├── screens/
│   │   │   ├── attempt_intro_screen.dart       # "Enter your name" or "Start"
│   │   │   ├── attempt_question_screen.dart
│   │   │   └── attempt_result_screen.dart
│   │   ├── widgets/
│   │   │   ├── question_view.dart
│   │   │   ├── attempt_progress.dart
│   │   │   ├── attempt_timer.dart
│   │   │   ├── result_hero_card.dart
│   │   │   ├── result_stats_row.dart
│   │   │   ├── breakdown_list.dart
│   │   │   └── share_buttons_row.dart
│   │   └── controllers/
│   │       └── attempt_controller.dart
│   │
│   ├── leaderboard/
│   │   ├── screens/
│   │   │   └── leaderboard_screen.dart
│   │   └── widgets/
│   │       └── leaderboard_list.dart
│   │
│   ├── creator_dashboard/
│   │   ├── screens/
│   │   │   └── quiz_detail_screen.dart
│   │   ├── widgets/
│   │   │   ├── dashboard_stats.dart
│   │   │   ├── hardest_question_card.dart
│   │   │   └── attempt_history_list.dart
│   │   └── controllers/
│   │       └── quiz_detail_controller.dart
│   │
│   └── challenge/
│       ├── screens/
│       │   └── challenge_intro_screen.dart     # "Aryan scored 8/10, beat them"
│       └── controllers/
│           └── challenge_controller.dart
│
└── firebase_options.dart                        # generated by flutterfire CLI

test/
├── unit/
│   ├── core/
│   ├── domain/
│   └── data/
└── widget/
    └── presentation/
```

---

## State Management — Riverpod

We use **riverpod_generator** for codegen and clarity.

### Provider Types Used
- `@riverpod` → most state and async operations
- `@Riverpod(keepAlive: true)` → singletons like repositories, sources
- `StateNotifierProvider` is **not** used — modern Riverpod doesn't need it
- `FutureProvider` and `StreamProvider` → for one-shot or stream-based data

### Provider Naming
- File: `<feature>_controller.dart`
- Function: `<feature>Controller`
- Generated provider: `<feature>ControllerProvider`

Example:
```dart
@riverpod
class HomeController extends _$HomeController {
  @override
  Future<HomeState> build() async {
    // ...
  }
}
```

### Repository Providers (singletons)
```dart
@Riverpod(keepAlive: true)
QuizRepository quizRepository(QuizRepositoryRef ref) {
  return QuizRepository(
    remote: ref.watch(firestoreQuizSourceProvider),
    local: ref.watch(localQuizSourceProvider),
  );
}
```

### Auth State Stream
Single source of truth for "who is the user right now":
```dart
@Riverpod(keepAlive: true)
Stream<AuthState> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
}
```

`AuthState` is a sealed class:
- `Authenticated(AppUser user)`
- `Guest(String deviceId)`
- `SignedOut`

The router listens to this stream to redirect.

---

## Navigation — Go Router

All routes are declared as constants in `lib/core/router/route_names.dart`.

### Route Tree
```
/splash                       → SplashScreen
/login                        → LoginScreen
/signup                       → SignupScreen
/                             → HomeScreen
/quiz/create                  → CreateQuizScreen
/quiz/create/question         → AddQuestionScreen
/quiz/published/:quizId       → QuizPublishedScreen
/quiz/:quizId                 → QuizDetailScreen          (creator dashboard)
/quiz/:quizId/leaderboard     → LeaderboardScreen
/attempt/intro/:code          → AttemptIntroScreen
/attempt/quiz/:attemptId      → AttemptQuestionScreen
/attempt/result/:attemptId    → AttemptResultScreen
/challenge/:challengeId       → ChallengeIntroScreen      (entry from deep link)
```

### Deep Link Handling
- Branch.io callbacks resolve to one of the above routes
- `app_router.dart` has a `refreshListenable` watching auth state and deep link state

### Guards / Redirect Logic
- If user is `SignedOut` and tries to access `/quiz/create` → redirect to `/login`
- Attempts are allowed for guests (no redirect)
- Splash decides initial route based on first launch + auth state

---

## Data Flow Example — "Create a Quiz"

```
1. UI    → CreateQuizScreen calls controller.publish()
2. Ctrl  → CreateQuizController validates input, builds Quiz model
3. Ctrl  → calls quizRepository.create(quiz)
4. Repo  → calls firestoreQuizSource.create(quizDto)
5. Repo  → also caches in localQuizSource (offline-tolerant)
6. Ctrl  → on success, sets state, navigates to QuizPublishedScreen
7. Ctrl  → on failure, sets error state, UI shows snackbar
```

---

## Data Flow Example — "Attempt a Quiz as Guest"

```
1. UI    → User enters code on HomeScreen
2. Ctrl  → HomeController.enterCode(code) calls quizRepo.fetchByCode(code)
3. Repo  → fetches from Firestore (no auth required, public read by code)
4. Ctrl  → router pushes /attempt/intro/:code
5. UI    → AttemptIntroScreen shows name entry or skips if anonymous
6. Ctrl  → AttemptController.start() creates a draft Attempt locally
7. UI    → AttemptQuestionScreen renders one question at a time
8. Ctrl  → on each answer, append to attempt.answers (in-memory + local Hive)
9. Ctrl  → on finish, submit attempt via attemptRepo.submit()
10. Repo → writes to Firestore /attempts collection
11. Repo → also saves to localAttemptSource (for guest history)
12. UI   → navigate to AttemptResultScreen
```

---

## Offline Handling

- All writes go to Hive first, then Firestore.
- A `pending_submissions` Hive box queues attempts that fail to upload.
- A `ConnectivityController` watches connectivity. When online, it flushes the queue.
- Reads always try local cache first, then Firestore (with `Source.serverAndCache`).

---

## Error Handling

- All repository methods return `Future<Result<T>>` where `Result` is a sealed class:
  - `Success<T>(T data)`
  - `Failure(FailureType type, String message, [Exception? cause])`
- Controllers catch all errors at this boundary and translate to UI state.
- UI never throws or catches exceptions directly.

---

## Logging

- Use `developer.log()` for debug only.
- Use `FirebaseCrashlytics.instance.recordError()` for production errors.
- No `print()` statements in code — lint rule enforced.

---

## Build Variants

| Variant | Use |
|---|---|
| `development` | Local dev — uses staging Firebase project |
| `production` | Release builds — uses prod Firebase project |

Configured via `--flavor` flag and `firebase_options_<flavor>.dart`.

---

## Dependency Versions

Specified in `pubspec.yaml`. Always pin to the minor version. List of essentials in `firebase.md`.
