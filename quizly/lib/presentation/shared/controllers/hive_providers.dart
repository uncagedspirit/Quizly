import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/sources/local/hive_init.dart';

part 'hive_providers.g.dart';

@Riverpod(keepAlive: true)
Box<dynamic> appStateBox(AppStateBoxRef ref) {
  return Hive.box(HiveInit.appStateBox);
}

@Riverpod(keepAlive: true)
Box<dynamic> guestAttemptsBox(GuestAttemptsBoxRef ref) {
  return Hive.box(HiveInit.guestAttemptsBox);
}

@Riverpod(keepAlive: true)
Box<dynamic> quizCacheBox(QuizCacheBoxRef ref) {
  return Hive.box(HiveInit.quizCacheBox);
}

@Riverpod(keepAlive: true)
Box<dynamic> quizDraftsBox(QuizDraftsBoxRef ref) {
  return Hive.box(HiveInit.quizDraftsBox);
}

@Riverpod(keepAlive: true)
Box<dynamic> pendingSubmissionsBox(PendingSubmissionsBoxRef ref) {
  return Hive.box(HiveInit.pendingSubmissionsBox);
}
