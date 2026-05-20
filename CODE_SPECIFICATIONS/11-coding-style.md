# 11 — Coding Style

Conventions every file in this project must follow. A coding agent should treat these as enforced rules, not guidelines.

---

## 1. Dart / Flutter General

### 1.1 Lint Setup
Use `analysis_options.yaml`:
```yaml
include: package:flutter_lints/flutter.yaml

analyzer:
  language:
    strict-casts: true
    strict-inference: true
    strict-raw-types: true
  errors:
    invalid_annotation_target: ignore
  plugins:
    - custom_lint

linter:
  rules:
    - always_declare_return_types
    - avoid_print
    - avoid_unused_constructor_parameters
    - prefer_const_constructors
    - prefer_const_constructors_in_immutables
    - prefer_const_declarations
    - prefer_const_literals_to_create_immutables
    - prefer_final_locals
    - prefer_single_quotes
    - unnecessary_const
    - unnecessary_new
    - require_trailing_commas
    - sized_box_for_whitespace
    - use_key_in_widget_constructors
```

### 1.2 Naming Conventions
- **Classes / Enums / Typedefs:** `PascalCase`
- **Constants:** `camelCase` (not `SCREAMING_CASE`)
- **Variables / Functions / Files:** `snake_case` for files, `camelCase` for code identifiers
- **Private:** prefix with underscore `_`
- **Booleans:** prefix with `is`, `has`, `should`, `can`

### 1.3 File Organization
- One public class per file
- Filename matches the class: `quiz_card.dart` → `class QuizCard`
- Private helper classes can share a file
- Imports order:
  1. Dart SDK (`dart:...`)
  2. Package (`package:flutter/...`, `package:firebase_...`)
  3. Project (`package:quizly/...` or relative)
- Blank line between groups, alphabetical within groups

---

## 2. Widget Conventions

### 2.1 Widget Structure
Prefer this exact order inside a widget class:
```dart
class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.label,
    this.onTap,
  });

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // ...
  }

  // private helpers below build
  Widget _buildSomething() { ... }
}
```

### 2.2 Stateless vs Stateful vs ConsumerWidget
- Default to `ConsumerWidget` or `StatelessWidget`
- Use `ConsumerStatefulWidget` only when local state (controllers, focus nodes, animations) is required AND can't be lifted into a provider
- Animations: use `flutter_animate` package's declarative API where possible; reach for `AnimationController` only when needed

### 2.3 Const Everywhere
- Every constructor that can be const, should be
- Every widget literal that can be const, should be
- This is enforced by lint rule

### 2.4 Spacing in Code
- Use `space-N` constants from `tokens.dart`, never magic numbers
- ❌ `SizedBox(height: 16)`
- ✅ `const SizedBox(height: Spacing.s4)`

### 2.5 No Inline Styles
- Colors come from `context.colors`
- Text styles come from `context.text`
- ❌ `Text('Hello', style: TextStyle(color: Colors.orange, fontSize: 16))`
- ✅ `Text('Hello', style: context.text.headingMd.copyWith(color: context.colors.orange))`

### 2.6 No Hardcoded Strings (in widgets)
- For MVP English-only, putting strings inline is OK
- BUT: extract to a `lib/core/constants/strings.dart` file when they appear in multiple places
- Prepare for future i18n by keeping strings centralized

### 2.7 Maximum Widget Depth
- If a build method has more than ~6 levels of nesting, extract sub-widgets
- Prefer small composable widgets over giant build methods

---

## 3. State Management (Riverpod)

### 3.1 Provider Patterns
- Use `@riverpod` codegen everywhere (no manual provider declarations)
- For repositories and sources: `@Riverpod(keepAlive: true)`
- For UI state controllers: default scope (auto-disposes)

### 3.2 Controller Pattern
```dart
@riverpod
class HomeController extends _$HomeController {
  @override
  Future<HomeState> build() async {
    return _fetch();
  }

  Future<HomeState> _fetch() async {
    final repo = ref.read(quizRepositoryProvider);
    // ...
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}
```

### 3.3 No Cross-Dependencies in Build
- Inside `build()`, use `ref.watch` for things that should rebuild the provider
- Use `ref.read` for one-shot reads (e.g., in event handlers)
- Use `ref.listen` for side-effects in providers

### 3.4 State Models
- Each controller has a typed state class (use freezed)
- Don't expose raw repository data — controllers shape it for UI

---

## 4. Error Handling

### 4.1 Result Pattern
Repository methods return `Future<Result<T>>`:
```dart
sealed class Result<T> {}
class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}
class Failure<T> extends Result<T> {
  final FailureType type;
  final String message;
  final Object? cause;
  Failure(this.type, this.message, [this.cause]);
}
```

### 4.2 No Throwing from Repositories
- All `try/catch` happens at the source layer
- Sources translate exceptions to `Failure` results
- Controllers consume Results and translate to UI state

### 4.3 User-Facing Error Messages
- Never show raw exception messages to users
- Map `FailureType` → message in `error_messages.dart`
- Examples: `network`, `notFound`, `permissionDenied`, `validation`, `unknown`

---

## 5. Async Patterns

### 5.1 Prefer async/await over .then()
- Cleaner control flow

### 5.2 Cancellation
- Long-running operations (streams, listeners) must be cleaned up in `dispose()` or by ref.onDispose

### 5.3 Don't Block UI
- Heavy computations: use `compute()` for isolates
- For most operations, async is enough

---

## 6. Logging & Debug

### 6.1 No `print()`
- Use `debugPrint()` for dev-only logs
- Use `developer.log()` for structured logs
- Use `FirebaseCrashlytics.instance.log()` for production logs visible in Crashlytics
- Use `FirebaseCrashlytics.instance.recordError()` for caught errors

### 6.2 Conditional Logs
- Avoid noisy logs in release builds
- Wrap with `if (kDebugMode) { ... }` where applicable

---

## 7. Testing

### 7.1 File Structure
- Test file mirrors source: `lib/core/utils/code_generator.dart` → `test/unit/core/utils/code_generator_test.dart`
- One `group()` per public method/class
- Descriptive test names: `'generates a 6-char code'`, `'throws when DB has too many collisions'`

### 7.2 Mocks
- Use `mocktail`
- Create mock classes in `test/mocks/` shared across tests
- Don't mock data models — use real freezed instances

### 7.3 Test Coverage Targets
- `core/utils`: 90%+
- `domain/usecases`: 90%+
- `data/repositories`: 70%+
- `presentation/controllers`: 60%+
- Widget tests: just core flows

---

## 8. Git Conventions

### 8.1 Commit Messages
Format: `<TaskID>: <imperative summary>`

Examples:
- `T9.4: implement quiz publish flow`
- `T5.1: add primary and secondary buttons`
- `T0.3: configure pubspec dependencies`

For fixes outside the task plan:
- `fix: prevent crash when code field is empty on submit`

For refactors:
- `refactor: extract leaderboard row into shared widget`

### 8.2 Branching (Optional)
- For solo dev: commit straight to `main`
- For team: feature branches named `feat/T<x>-<description>`

### 8.3 What to Commit
- All `.dart` files
- `pubspec.yaml`, `pubspec.lock`, `analysis_options.yaml`
- `firebase_options.dart`
- Platform configs that ARE committed: `AndroidManifest.xml`, `Info.plist`, generated `google-services.json` for non-secret prod project (rotate if compromised)
- `firestore.rules`, `firestore.indexes.json`

### 8.4 What NOT to Commit
- `android/key.properties` (signing config)
- `.env` files with secrets
- Keystores
- Personal IDE configs (`.idea/`, `.vscode/launch.json` is okay but workspace settings not)

---

## 9. Code Generation Workflow

### 9.1 When to Run
After modifying:
- Any `*.freezed.dart` model annotations
- Any `@riverpod` provider declarations
- Any `*.g.dart` JSON serialization

### 9.2 Commands
```bash
# One-shot
dart run build_runner build --delete-conflicting-outputs

# Watch mode during development
dart run build_runner watch --delete-conflicting-outputs
```

### 9.3 Don't Edit Generated Files
- Anything ending in `.freezed.dart`, `.g.dart` is auto-generated
- Edit the source file and re-run

---

## 10. Comments & Documentation

### 10.1 When to Comment
- Public APIs of repositories, use cases, and shared widgets need doc comments
- Complex algorithms need an explanatory comment
- Workarounds for known issues need a `// HACK:` or `// TODO:` comment with reason

### 10.2 Doc Comment Style
```dart
/// Fetches the leaderboard for a quiz, ordered by score and tie-broken by time.
///
/// Returns up to [limit] entries (default 100).
/// Throws [QuizNotFoundException] if the quiz does not exist.
Future<List<LeaderboardEntry>> fetchLeaderboard(String quizId, {int limit = 100});
```

### 10.3 No Useless Comments
- ❌ `// increment i by 1`
- ✅ `// debounce by 300ms to avoid hammering Firestore on every keystroke`

---

## 11. Performance Conventions

### 11.1 ListView Performance
- Use `ListView.builder`, never `ListView(children: [...])` for dynamic lists
- Use `cacheExtent` for smoother scrolling on long lists

### 11.2 Image Loading
- Use `CachedNetworkImage` (already in pubspec via implicit deps) for remote images
- Provide placeholder + error widgets

### 11.3 Avoid Rebuilds
- Use `select` to subscribe to specific fields
- ❌ `final state = ref.watch(homeControllerProvider);`
- ✅ `final isLoading = ref.watch(homeControllerProvider.select((s) => s.isLoading));`

### 11.4 Const All The Things
- Lint catches most; double-check manually for collection literals

---

## 12. Anti-Patterns to Avoid

| Don't | Do Instead |
|---|---|
| `setState` outside `StatefulWidget` | Use Riverpod controllers |
| Singletons via globals | Use Riverpod `keepAlive: true` providers |
| `Provider.of<X>` (old pattern) | Use `ref.watch(xProvider)` |
| Direct Firestore calls in widgets | Always go through a repository |
| Magic numbers in widgets | Use tokens from `tokens.dart` |
| Color literals (`Color(0xFF...)`) in widgets | Use `context.colors.x` |
| Pure GestureDetector for taps | Use `InkWell` for ripple OR `GestureDetector` + `AnimatedScale` for our custom feel |
| `print()` | `debugPrint()` or `developer.log()` |
| Mutating model fields | All models are immutable (freezed); use `.copyWith()` |
| Sync code with `.then()` chains | Use `async/await` |

---

## 13. Quick Reference

When in doubt:
- **Design:** `04-design.md` — ALL visual decisions
- **Code structure:** `02-architecture.md` — folder placement, layering
- **Business logic:** `06-features.md` — exact algorithms
- **Data shape:** `03-database.md` — schemas

If a code agent ever finds itself making a design or architectural decision NOT covered in these docs:
1. Stop
2. Default to the simpler choice
3. Add a `// REVIEW:` comment for human follow-up
