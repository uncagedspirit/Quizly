# 09 — Notifications

This document defines all notification logic: FCM (push), local notifications, payload structures, and handling for both foreground and background states.

---

## 1. Notification Strategy Overview

| Type | When | Channel |
|---|---|---|
| Quiz deadline reached → results revealed | Quiz deadline passes | FCM push |
| Reminder before deadline (1 hour) | Scheduled when user attempts a quiz with deadline | Local notification |
| New attempts on your quiz | Debounced once per day per creator | FCM push (post-MVP via Cloud Function) |
| Challenge received | When user is the target of a challenge | Local notification on link open (MVP) |

> For MVP without Cloud Functions, deadline-triggered fan-out notifications are simulated client-side via local notifications scheduled at attempt time. True server-side fan-out is added post-MVP.

---

## 2. FCM Initialization

In `lib/data/sources/remote/fcm_source.dart`:

```dart
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FcmSource {
  final _fm = FirebaseMessaging.instance;

  Future<NotificationSettings> requestPermission() async {
    return await _fm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<String?> getToken() => _fm.getToken();

  Stream<String> get onTokenRefresh => _fm.onTokenRefresh;

  Stream<RemoteMessage> get onForegroundMessage => FirebaseMessaging.onMessage;

  Stream<RemoteMessage> get onMessageOpenedApp => FirebaseMessaging.onMessageOpenedApp;

  Future<RemoteMessage?> getInitialMessage() => _fm.getInitialMessage();

  // Background handler must be a top-level function
}

// Top-level function — required by FCM for background handling
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint('Background message received: ${message.messageId}');
  // Could perform background analytics or data sync here.
  // Do NOT update UI from this function.
}
```

Register the background handler **before** `runApp` in `main.dart`:
```dart
FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
```

---

## 3. Token Management

### 3.1 On App Start
1. Get the FCM token
2. Get the deviceId from Hive
3. Write to `/device_tokens/{deviceId}`:
```dart
await firestore.collection('device_tokens').doc(deviceId).set({
  'deviceId': deviceId,
  'fcmToken': token,
  'platform': Platform.isAndroid ? 'android' : 'ios',
  'linkedUserId': authState is AuthAuthenticated ? authState.user.uid : null,
  'updatedAt': FieldValue.serverTimestamp(),
}, SetOptions(merge: true));  // merge to preserve subscribedQuizIds
```

### 3.2 On Token Refresh
Listen to `onTokenRefresh` and update the doc.

### 3.3 On Login
When a user logs in, update `linkedUserId` on their device_tokens doc.

### 3.4 On Logout
- Do NOT delete the token doc. The device is still valid.
- Just set `linkedUserId: null`.

---

## 4. Subscribing to Quiz Notifications

When user attempts a quiz with a deadline, automatically subscribe:
```dart
await firestore.collection('device_tokens').doc(deviceId).update({
  'subscribedQuizIds': FieldValue.arrayUnion([quizId]),
});
```

When user creates a quiz, auto-subscribe so creator gets notified of attempts (post-MVP).

---

## 5. Local Notifications (MVP Primary)

Use `flutter_local_notifications` package for any scheduled, on-device notification.

### 5.1 Initialization
```dart
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationsService {
  final _plugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    tz.initializeTimeZones();

    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _plugin.initialize(
      const InitializationSettings(android: androidInit, iOS: iosInit),
      onDidReceiveNotificationResponse: _onTap,
    );
  }

  void _onTap(NotificationResponse response) {
    // Handle by reading payload and routing
  }
}
```

### 5.2 Channel Setup (Android)
```dart
const channel = AndroidNotificationChannel(
  'quizly_default',                        // id
  'Quizly Notifications',                   // name
  description: 'Updates about your quizzes',
  importance: Importance.high,
);

await _plugin
    .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
    ?.createNotificationChannel(channel);
```

### 5.3 Scheduling: Deadline Reminder
When user attempts a quiz with a deadline:
```dart
await _plugin.zonedSchedule(
  generatedId,                                 // notification id
  'Quiz ending soon',
  "[Quiz Title] closes in 1 hour",
  tz.TZDateTime.from(deadline.subtract(const Duration(hours: 1)), tz.local),
  const NotificationDetails(
    android: AndroidNotificationDetails(
      'quizly_default',
      'Quizly Notifications',
      importance: Importance.high,
      priority: Priority.high,
    ),
    iOS: DarwinNotificationDetails(),
  ),
  androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
  payload: json.encode({'type': 'deadline_soon', 'quizId': quizId, 'attemptId': attemptId}),
);
```

Only schedule if deadline > 1 hour away. Otherwise skip.

### 5.4 Scheduling: Deadline Reveal
When user attempts a quiz with a deadline AND reveal mode is `atEnd`:
```dart
await _plugin.zonedSchedule(
  revealNotificationId,
  'Results are in!',
  "Your score for '[Quiz Title]' is now revealed",
  tz.TZDateTime.from(deadline.add(const Duration(seconds: 30)), tz.local),  // 30s buffer
  // ... same details
  payload: json.encode({'type': 'deadline_reveal', 'quizId': quizId, 'attemptId': attemptId}),
);
```

### 5.5 Cancellation
- On attempt submit: cancel the 1-hour-before reminder (no longer relevant since they attempted)
- Actually: keep it — the reminder is for the deadline, not for "you haven't attempted." Cancel only if user views result post-deadline.

Use unique notification IDs derived from quiz/attempt IDs:
```dart
int _notificationId(String type, String quizId) {
  // Hash the combination to get a stable ID
  return '$type:$quizId'.hashCode & 0x7FFFFFFF;
}
```

---

## 6. Foreground vs Background

### 6.1 Foreground Push (FCM)
- App is open and visible
- Default behavior: notifications do NOT show as system tray. We override:
  - Show an in-app banner (slide down from top) using a custom widget
  - Or use a snackbar

### 6.2 Background Push (FCM)
- App is in background, suspended, or killed
- System tray notification shows automatically
- On tap → app opens, `getInitialMessage()` or `onMessageOpenedApp` provides the message

### 6.3 Routing from Notification Tap
```dart
void _handleNotificationTap(RemoteMessage message) {
  final type = message.data['type'];
  switch (type) {
    case 'deadline_reveal':
      final attemptId = message.data['attemptId'];
      router.push('/attempt/result/$attemptId');
    case 'new_attempt':
      final quizId = message.data['quizId'];
      router.push('/quiz/$quizId');
    case 'challenge':
      final challengeId = message.data['challengeId'];
      router.push('/challenge/$challengeId');
  }
}
```

Wire this up in `app.dart`:
```dart
// Cold start
FirebaseMessaging.instance.getInitialMessage().then((msg) {
  if (msg != null) _handleNotificationTap(msg);
});

// Background → foreground
FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

// Foreground arrival
FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
```

---

## 7. Permission Handling

### 7.1 First Launch
- Don't show the permission prompt immediately
- After user's first quiz interaction (attempt or create), show a soft prompt explaining benefits, then request permission
- Soft prompt UI:
  ```
  🔔 Stay in the loop
  Get notified when quiz results are
  revealed and new attempts come in.

  [ Maybe later ]   [ Enable ]
  ```

### 7.2 Denied State
- Continue without notifications
- Show a banner in settings: "Enable notifications to see results when deadlines pass"
- Don't nag in main flows

---

## 8. Notification UI in-app

For foreground FCM messages, render a custom banner:
```dart
class InAppNotificationBanner extends StatelessWidget {
  final String title;
  final String body;
  final VoidCallback onTap;

  // Slides down from top, auto-dismisses after 4 seconds
  // Padded card with title (heading-sm) + body (body-sm)
  // Tap → onTap + dismiss
}
```

Reuse the existing card design tokens.

---

## 9. Notification Payload Schemas

### 9.1 `deadline_reveal`
```json
{
  "notification": {
    "title": "Results are in!",
    "body": "Your score for 'World Geography' is now revealed"
  },
  "data": {
    "type": "deadline_reveal",
    "quizId": "abc123",
    "attemptId": "xyz789"
  }
}
```

### 9.2 `deadline_soon` (local)
```json
{
  "title": "Quiz ending soon",
  "body": "'World Geography' closes in 1 hour",
  "payload": "{\"type\":\"deadline_soon\",\"quizId\":\"abc123\"}"
}
```

### 9.3 `new_attempt` (post-MVP)
```json
{
  "notification": {
    "title": "Someone took your quiz!",
    "body": "5 new attempts on 'World Geography'"
  },
  "data": {
    "type": "new_attempt",
    "quizId": "abc123",
    "count": "5"
  }
}
```

### 9.4 `challenge` (post-MVP)
```json
{
  "notification": {
    "title": "You've been challenged!",
    "body": "Aryan scored 8/10. Can you beat them?"
  },
  "data": {
    "type": "challenge",
    "challengeId": "ch_abc",
    "quizId": "abc123",
    "challengerName": "Aryan"
  }
}
```

---

## 10. Testing Notifications

### 10.1 Test FCM
1. Get the token from logs
2. Use Firebase Console → Cloud Messaging → Send Test Message
3. Paste token, configure title/body, send

### 10.2 Test Local Notifications
- Schedule a notification 10 seconds in the future
- Background the app
- Wait

### 10.3 Test Deep Link from Notification
- Send FCM with `data.type = "deadline_reveal"` and `data.attemptId = "<real id>"`
- Tap notification
- App should open to result screen

---

## 11. Common Issues

| Issue | Fix |
|---|---|
| Android: notification doesn't show in background | Confirm Android channel created with high importance |
| iOS: notification doesn't show | Push capability missing in Xcode |
| iOS: token always null in simulator | FCM doesn't work in simulator; test on real device |
| Notification opens app but doesn't route | `getInitialMessage()` not called on cold start, or router not ready |
| Permission denied on iOS, can't re-request | User must go to system settings; show in-app prompt explaining |

---

## 12. Cloud Functions (Post-MVP)

True server-side notifications require:
- Firestore-triggered Cloud Function that runs when an attempt is submitted
- Looks up the creator's device_tokens
- Sends FCM via Firebase Admin SDK
- Debounces by querying recent attempts per creator

This is the path to:
- Quiz deadline reveal fan-out (notify all attempters)
- New attempt notifications to creators
- Challenge received notifications

**Defer to v1.1.** MVP uses local notifications for deadline reminders.

---

## 13. Notification Settings Screen (Future)

In a future Settings screen, expose toggles:
- Enable notifications (master)
- Notify when results revealed
- Notify when someone attempts my quiz
- Notify when challenged

For MVP: no settings UI; notifications follow system permission only.
