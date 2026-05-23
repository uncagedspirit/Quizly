import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/sources/remote/firebase_auth_source.dart';
import '../../../data/sources/remote/firestore_quiz_source.dart';
import '../../../data/sources/remote/firestore_attempt_source.dart';
import '../../../data/sources/remote/firestore_user_source.dart';
import '../../../data/sources/remote/fcm_source.dart';
import '../../../data/sources/remote/branch_source.dart';
import '../../../data/sources/local/local_user_source.dart';
import '../../../data/sources/local/local_quiz_source.dart';
import '../../../data/sources/local/local_attempt_source.dart';
import '../../../data/repositories/auth_repository.dart';
import '../../../data/repositories/quiz_repository.dart';
import '../../../data/repositories/attempt_repository.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../data/repositories/notification_repository.dart';
import '../../../data/repositories/deeplink_repository.dart';
import 'hive_providers.dart';

part 'app_providers.g.dart';

@Riverpod(keepAlive: true)
FirebaseFirestore firestore(FirestoreRef ref) {
  final instance = FirebaseFirestore.instance;
  instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );
  return instance;
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@Riverpod(keepAlive: true)
GoogleSignIn googleSignIn(GoogleSignInRef ref) {
  return GoogleSignIn.standard();
}

@Riverpod(keepAlive: true)
FirebaseMessaging firebaseMessaging(FirebaseMessagingRef ref) {
  return FirebaseMessaging.instance;
}

@Riverpod(keepAlive: true)
FirebaseAuthSource firebaseAuthSource(FirebaseAuthSourceRef ref) {
  return FirebaseAuthSource(
    ref.watch(firebaseAuthProvider),
    ref.watch(googleSignInProvider),
  );
}

@Riverpod(keepAlive: true)
FirestoreQuizSource firestoreQuizSource(FirestoreQuizSourceRef ref) {
  return FirestoreQuizSource(ref.watch(firestoreProvider));
}

@Riverpod(keepAlive: true)
FirestoreAttemptSource firestoreAttemptSource(FirestoreAttemptSourceRef ref) {
  return FirestoreAttemptSource(ref.watch(firestoreProvider));
}

@Riverpod(keepAlive: true)
FirestoreUserSource firestoreUserSource(FirestoreUserSourceRef ref) {
  return FirestoreUserSource(ref.watch(firestoreProvider));
}

@Riverpod(keepAlive: true)
FcmSource fcmSource(FcmSourceRef ref) {
  return FcmSource(ref.watch(firebaseMessagingProvider));
}

@Riverpod(keepAlive: true)
BranchSource branchSource(BranchSourceRef ref) {
  return BranchSource();
}

@Riverpod(keepAlive: true)
LocalUserSource localUserSource(LocalUserSourceRef ref) {
  return LocalUserSource(ref.watch(appStateBoxProvider));
}

@Riverpod(keepAlive: true)
LocalQuizSource localQuizSource(LocalQuizSourceRef ref) {
  return LocalQuizSource(ref.watch(quizCacheBoxProvider));
}

@Riverpod(keepAlive: true)
LocalAttemptSource localAttemptSource(LocalAttemptSourceRef ref) {
  return LocalAttemptSource(
    ref.watch(guestAttemptsBoxProvider),
    ref.watch(pendingSubmissionsBoxProvider),
  );
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(
    ref.watch(firebaseAuthSourceProvider),
    ref.watch(firestoreUserSourceProvider),
    ref.watch(localUserSourceProvider),
    ref.watch(firestoreProvider),
  );
}

@Riverpod(keepAlive: true)
QuizRepository quizRepository(QuizRepositoryRef ref) {
  return QuizRepository(
    ref.watch(firestoreQuizSourceProvider),
    ref.watch(localQuizSourceProvider),
  );
}

@Riverpod(keepAlive: true)
AttemptRepository attemptRepository(AttemptRepositoryRef ref) {
  return AttemptRepository(
    ref.watch(firestoreAttemptSourceProvider),
    ref.watch(localAttemptSourceProvider),
  );
}

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(ref.watch(firestoreUserSourceProvider));
}

@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(NotificationRepositoryRef ref) {
  return NotificationRepository(ref.watch(fcmSourceProvider));
}

@Riverpod(keepAlive: true)
DeeplinkRepository deeplinkRepository(DeeplinkRepositoryRef ref) {
  return DeeplinkRepository(ref.watch(branchSourceProvider));
}
