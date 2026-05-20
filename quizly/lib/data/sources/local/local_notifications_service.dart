import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationsService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  void Function(String? payload)? onNotificationTap;

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

    final androidPlugin =
        _plugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    const channel = AndroidNotificationChannel(
      'quizly_default',
      'Quizly Notifications',
      description: 'Updates about your quizzes',
      importance: Importance.high,
    );

    await androidPlugin?.createNotificationChannel(channel);
  }

  void _onTap(NotificationResponse response) {
    onNotificationTap?.call(response.payload);
  }

  Future<void> scheduleDeadlineReminder({
    required int id,
    required String quizId,
    required String attemptId,
    required String quizTitle,
    required DateTime deadline,
  }) async {
    final scheduledDate = deadline.subtract(const Duration(hours: 1));
    if (scheduledDate.isBefore(DateTime.now())) return;

    await _plugin.zonedSchedule(
      id,
      'Quiz ending soon',
      "'$quizTitle' closes in 1 hour",
      tz.TZDateTime.from(scheduledDate, tz.local),
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
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: json.encode({
        'type': 'deadline_soon',
        'quizId': quizId,
        'attemptId': attemptId,
      }),
    );
  }

  Future<void> scheduleDeadlineReveal({
    required int id,
    required String quizId,
    required String attemptId,
    required String quizTitle,
    required DateTime deadline,
  }) async {
    final scheduledDate = deadline.add(const Duration(seconds: 30));

    await _plugin.zonedSchedule(
      id,
      'Results are in!',
      "Your score for '$quizTitle' is now revealed",
      tz.TZDateTime.from(scheduledDate, tz.local),
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
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: json.encode({
        'type': 'deadline_reveal',
        'quizId': quizId,
        'attemptId': attemptId,
      }),
    );
  }

  Future<void> cancelNotification(int id) async {
    await _plugin.cancel(id);
  }

  static int notificationId(String type, String quizId) {
    return ('$type:$quizId').hashCode & 0x7FFFFFFF;
  }
}
