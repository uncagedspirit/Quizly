import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class HiveInit {
  HiveInit._();

  static const String appStateBox = 'app_state';
  static const String guestAttemptsBox = 'guest_attempts';
  static const String quizCacheBox = 'quiz_cache';
  static const String quizDraftsBox = 'quiz_drafts';
  static const String pendingSubmissionsBox = 'pending_submissions';

  static Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox<dynamic>(appStateBox);
    await Hive.openBox<dynamic>(guestAttemptsBox);
    await Hive.openBox<dynamic>(quizCacheBox);
    await Hive.openBox<dynamic>(quizDraftsBox);
    await Hive.openBox<dynamic>(pendingSubmissionsBox);

    final appState = Hive.box<dynamic>(appStateBox);
    if (!appState.containsKey('device_id')) {
      await appState.put('device_id', const Uuid().v4());
    }
  }
}
