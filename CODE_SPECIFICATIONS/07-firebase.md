# 07 — Firebase Setup

This document contains every step to set up Firebase for the project, plus the exact dependencies to include. A coding agent should be able to execute this end-to-end.

---

## 1. Firebase Project

### 1.1 Create Two Projects
- `quizly-dev` — development/staging
- `quizly-prod` — production

For MVP, **only `quizly-prod` is required**. Skip dev unless multiple devs are working in parallel.

### 1.2 Enable Services
Inside the Firebase Console for each project, enable:
- **Authentication** → Sign-in methods: Google + Email/Password
- **Cloud Firestore** → Native mode, region `nam5` (or closest to target users)
- **Cloud Messaging** → no setup needed beyond enabling
- **Storage** → default bucket (used for share card uploads if cloud-stored; MVP keeps local)
- **Crashlytics** → enable
- **Analytics** → enable

### 1.3 Add Apps
Add both Android and iOS apps to each project.

**Android:**
- Package name: `com.quizly.app`
- Add app to Firebase, download `google-services.json`
- Place in `android/app/google-services.json`

**iOS:**
- Bundle ID: `com.quizly.app`
- Add app to Firebase, download `GoogleService-Info.plist`
- Place in `ios/Runner/GoogleService-Info.plist`

### 1.4 Generate Firebase Options via FlutterFire CLI
```bash
dart pub global activate flutterfire_cli
flutterfire configure --project=quizly-prod
```
This creates `lib/firebase_options.dart`. Commit this file.

---

## 2. Pubspec Dependencies

```yaml
name: quizly
description: Quizly mobile app
publish_to: 'none'
version: 0.1.0+1

environment:
  sdk: '>=3.4.0 <4.0.0'
  flutter: ">=3.22.0"

dependencies:
  flutter:
    sdk: flutter

  # Firebase
  firebase_core: ^3.6.0
  firebase_auth: ^5.3.1
  cloud_firestore: ^5.4.4
  firebase_messaging: ^15.1.3
  firebase_analytics: ^11.3.3
  firebase_crashlytics: ^4.1.3
  firebase_storage: ^12.3.3

  # Auth
  google_sign_in: ^6.2.1

  # State management
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5

  # Routing
  go_router: ^14.2.7

  # Local storage
  hive: ^2.2.3
  hive_flutter: ^1.1.0

  # Models
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0

  # Networking utility
  uuid: ^4.5.1
  connectivity_plus: ^6.0.5

  # Deep links
  flutter_branch_sdk: ^8.4.0

  # UI utilities
  material_symbols_icons: ^4.2785.1
  google_fonts: ^6.2.1
  flutter_animate: ^4.5.0
  shimmer: ^3.0.0

  # Sharing
  share_plus: ^10.0.2
  screenshot: ^3.0.0
  path_provider: ^2.1.4

  # Local notifications
  flutter_local_notifications: ^17.2.3
  timezone: ^0.9.4

  # Utils
  intl: ^0.19.0
  collection: ^1.18.0
  equatable: ^2.0.5

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0

  # Codegen
  build_runner: ^2.4.13
  freezed: ^2.5.7
  json_serializable: ^6.8.0
  riverpod_generator: ^2.4.3
  custom_lint: ^0.6.4
  riverpod_lint: ^2.3.13

  # Testing
  mocktail: ^1.0.4

flutter:
  uses-material-design: true
  fonts:
    - family: Nunito
      fonts:
        - asset: assets/fonts/Nunito-Bold.ttf
          weight: 700
        - asset: assets/fonts/Nunito-ExtraBold.ttf
          weight: 800
        - asset: assets/fonts/Nunito-Black.ttf
          weight: 900
        - asset: assets/fonts/Nunito-ExtraBoldItalic.ttf
          weight: 800
          style: italic
        - asset: assets/fonts/Nunito-BlackItalic.ttf
          weight: 900
          style: italic
    - family: Figtree
      fonts:
        - asset: assets/fonts/Figtree-Regular.ttf
          weight: 400
        - asset: assets/fonts/Figtree-Medium.ttf
          weight: 500
        - asset: assets/fonts/Figtree-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Figtree-Bold.ttf
          weight: 700
        - asset: assets/fonts/Figtree-ExtraBold.ttf
          weight: 800
```

**Download font files from Google Fonts** and place in `assets/fonts/`. Do not use `google_fonts` package for these to avoid runtime download.

---

## 3. Android-Specific Setup

### 3.1 `android/build.gradle`
Add Google Services plugin to the project-level buildscript:
```gradle
buildscript {
    dependencies {
        classpath 'com.google.gms:google-services:4.4.2'
        classpath 'com.google.firebase:firebase-crashlytics-gradle:3.0.2'
    }
}
```

### 3.2 `android/app/build.gradle`
At the very bottom:
```gradle
apply plugin: 'com.google.gms.google-services'
apply plugin: 'com.google.firebase.crashlytics'
```

In `defaultConfig`:
```gradle
minSdkVersion 23
targetSdkVersion 34
multiDexEnabled true
```

### 3.3 SHA Fingerprints for Google Sign-In
1. Get debug SHA-1: `cd android && ./gradlew signingReport`
2. Get release SHA-1 from your keystore: `keytool -list -v -keystore <path>`
3. Add both to Firebase Console → Project Settings → Your Android App → Add Fingerprint
4. Re-download `google-services.json` and replace in `android/app/`

### 3.4 Permissions in `AndroidManifest.xml`
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.VIBRATE"/>
<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM"/>
```

Inside `<application>`:
```xml
<meta-data
    android:name="com.google.firebase.messaging.default_notification_icon"
    android:resource="@mipmap/ic_launcher" />
<meta-data
    android:name="com.google.firebase.messaging.default_notification_color"
    android:resource="@color/notification_color" />
```

Create `android/app/src/main/res/values/colors.xml`:
```xml
<resources>
    <color name="notification_color">#D77204</color>
</resources>
```

### 3.5 App Links (Android — for deep links fallback)
Inside `<activity>` in `AndroidManifest.xml`:
```xml
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="https"
          android:host="quizly.link" />
</intent-filter>
```

### 3.6 ProGuard Rules
Create `android/app/proguard-rules.pro`:
```
-keep class com.google.firebase.** { *; }
-keep class io.flutter.** { *; }
-keep class io.branch.** { *; }
-dontwarn io.branch.**
```

---

## 4. iOS-Specific Setup

### 4.1 `ios/Podfile`
```ruby
platform :ios, '13.0'
```

After adding Firebase dependencies, run:
```bash
cd ios && pod install
```

### 4.2 URL Schemes for Google Sign-In
In `ios/Runner/Info.plist`, add:
```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleTypeRole</key>
    <string>Editor</string>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>REVERSED_CLIENT_ID_FROM_GoogleService-Info.plist</string>
    </array>
  </dict>
</array>
```
Copy the `REVERSED_CLIENT_ID` value from `GoogleService-Info.plist`.

### 4.3 Push Notifications Capability
Open `ios/Runner.xcworkspace` in Xcode:
- Targets → Runner → Signing & Capabilities → + Capability
- Add: **Push Notifications**
- Add: **Background Modes** → check "Remote notifications"

### 4.4 APNs Setup
- In Apple Developer Console, create an APNs key (.p8 file)
- Upload it to Firebase Console → Project Settings → Cloud Messaging → APNs Authentication Key

### 4.5 Universal Links (iOS)
- In Apple Developer Console, enable Associated Domains capability
- Add `applinks:quizly.link` to the entitlements
- Host `apple-app-site-association` file at `https://quizly.link/.well-known/apple-app-site-association`

### 4.6 Permissions in `Info.plist`
```xml
<key>NSUserTrackingUsageDescription</key>
<string>This helps us understand which features people enjoy most.</string>
```

---

## 5. Firebase Initialization in Code

### 5.1 `lib/main.dart`
```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'firebase_options.dart';
import 'app.dart';
import 'data/sources/local/hive_init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Pass Flutter errors to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await HiveInit.init();

  runApp(const ProviderScope(child: QuizlyApp()));
}
```

### 5.2 `lib/data/sources/local/hive_init.dart`
```dart
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class HiveInit {
  static const _appStateBox = 'app_state';
  static const _guestAttemptsBox = 'guest_attempts';
  static const _quizCacheBox = 'quiz_cache';
  static const _quizDraftsBox = 'quiz_drafts';
  static const _pendingSubmissionsBox = 'pending_submissions';

  static Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox(_appStateBox);
    await Hive.openBox(_guestAttemptsBox);
    await Hive.openBox(_quizCacheBox);
    await Hive.openBox(_quizDraftsBox);
    await Hive.openBox(_pendingSubmissionsBox);

    // Ensure a deviceId exists
    final appState = Hive.box(_appStateBox);
    if (!appState.containsKey('device_id')) {
      await appState.put('device_id', const Uuid().v4());
    }
  }
}
```

---

## 6. Firestore Persistence

Enable offline persistence:
```dart
FirebaseFirestore.instance.settings = const Settings(
  persistenceEnabled: true,
  cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
);
```
Set this once on first use (before any read/write).

---

## 7. FCM Configuration in Code

See `09-notifications.md` for the full handler. Key initialization in `main.dart` or via a Riverpod startup task:

```dart
await FirebaseMessaging.instance.requestPermission(
  alert: true, badge: true, sound: true,
);

final token = await FirebaseMessaging.instance.getToken();
// Save token to /device_tokens/{deviceId}

FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
  // Update Firestore
});
```

---

## 8. Deploying Firestore Rules and Indexes

### 8.1 Install Firebase CLI
```bash
npm install -g firebase-tools
firebase login
firebase init firestore
```

### 8.2 Place Rules
File: `firestore.rules` — copy the rules from `03-database.md` exactly.

### 8.3 Place Indexes
File: `firestore.indexes.json` — copy the indexes from `03-database.md` exactly.

### 8.4 Deploy
```bash
firebase deploy --only firestore:rules
firebase deploy --only firestore:indexes
```

---

## 9. Build Configuration

### 9.1 Release Build Command (Android)
```bash
flutter build appbundle --release
```

### 9.2 Release Build Command (iOS)
```bash
flutter build ipa --release
```

### 9.3 Signing
- Android: configure `android/key.properties` with keystore credentials. Never commit this file.
- iOS: configure via Xcode Automatic Signing or manual provisioning profiles.

---

## 10. Verification Checklist

After setup, verify each item:
- [ ] App launches without Firebase errors in logs
- [ ] `await Firebase.initializeApp()` completes
- [ ] Hive boxes open successfully
- [ ] Google Sign-In opens the native dialog
- [ ] Email signup creates a user in Firebase Auth + Firestore `/users/{uid}`
- [ ] A test quiz can be created and the doc appears in Firestore
- [ ] Firestore reads return cached data when offline
- [ ] FCM token is logged on first launch
- [ ] Crashlytics catches a forced `throw Exception()` (test it)
- [ ] Branch.io initializes (token visible in logs)

---

## 11. Common Pitfalls

| Issue | Fix |
|---|---|
| `google_sign_in` returns null on Android | SHA-1 not added to Firebase. Add and re-download `google-services.json`. |
| iOS FCM token always null in debug | Push capability missing or APNs key not uploaded. |
| Firestore "permission denied" on legitimate read | Security rule too strict; verify rule file deployed. |
| Hive box not found | Forgot to `await Hive.openBox(...)`. |
| Branch.io not opening to correct screen | Universal Links setup incomplete or wrong path scheme. |
| App size > 30MB | Run `flutter build --analyze-size`; trim unused packages, check assets. |

---

## 12. Environment Variables (Future)

For now, all config is in `firebase_options.dart` and `env.dart`. If switching to dev/prod flavors:
- Use `--dart-define` flags
- Or use `flutter_flavorizr` package
- Mirror `firebase_options_dev.dart` and `firebase_options_prod.dart`

Not required for MVP.
