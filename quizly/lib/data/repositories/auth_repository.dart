import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/models/app_user.dart';
import '../sources/remote/firebase_auth_source.dart';
import '../sources/remote/firestore_user_source.dart';
import '../sources/local/local_user_source.dart';

class AuthRepository {
  AuthRepository(
    this._authSource,
    this._userSource,
    this._localUserSource,
    this._firestore,
  );

  final FirebaseAuthSource _authSource;
  final FirestoreUserSource _userSource;
  final LocalUserSource _localUserSource;
  final FirebaseFirestore _firestore;

  User? get currentUser => _authSource.currentUser;
  Stream<User?> authStateChanges() => _authSource.authStateChanges();

  String? get deviceId => _localUserSource.deviceId;

  Future<void> signInWithGoogle() async {
    await _authSource.signInWithGoogle();
    await _ensureUserDoc();
    await _migrateGuestAttempts();
  }

  Future<void> signInWithEmail(String email, String password) async {
    await _authSource.signInWithEmail(email, password);
    await _ensureUserDoc();
    await _migrateGuestAttempts();
  }

  Future<void> signUpWithEmail(
    String email,
    String password,
    String displayName,
  ) async {
    await _authSource.signUpWithEmail(email, password, displayName);
    final user = _authSource.currentUser;
    if (user != null) {
      final appUser = AppUser(
        uid: user.uid,
        email: user.email ?? email,
        displayName: displayName,
        createdAt: DateTime.now(),
      );
      await _userSource.createUser(appUser);
    }
    await _migrateGuestAttempts();
  }

  Future<void> signOut() async {
    await _authSource.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _authSource.sendPasswordResetEmail(email);
  }

  Future<AppUser?> getCurrentUserProfile() async {
    final user = _authSource.currentUser;
    if (user == null) return null;
    return _userSource.getUserById(user.uid);
  }

  Future<int> migrateGuestAttempts() async {
    return _migrateGuestAttempts();
  }

  Future<int> _migrateGuestAttempts() async {
    final user = _authSource.currentUser;
    final deviceId = _localUserSource.deviceId;
    if (user == null || deviceId == null) return 0;

    final guestAttempts = await _firestore
        .collection('attempts')
        .where('deviceId', isEqualTo: deviceId)
        .where('attempterId', isEqualTo: null)
        .get();

    if (guestAttempts.docs.isEmpty) return 0;

    final batch = _firestore.batch();
    for (final doc in guestAttempts.docs) {
      batch.update(doc.reference, {'attempterId': user.uid});
    }
    await batch.commit();

    await _firestore
        .collection('device_tokens')
        .doc(deviceId)
        .update({'linkedUserId': user.uid});

    return guestAttempts.docs.length;
  }

  Future<void> _ensureUserDoc() async {
    final user = _authSource.currentUser;
    if (user == null) return;

    final existing = await _userSource.getUserById(user.uid);
    if (existing == null) {
      final appUser = AppUser(
        uid: user.uid,
        email: user.email ?? '',
        displayName: user.displayName,
        photoUrl: user.photoURL,
        createdAt: DateTime.now(),
      );
      await _userSource.createUser(appUser);
    } else {
      await _userSource.updateLastSeen(user.uid);
    }

    final deviceId = _localUserSource.deviceId;
    if (deviceId != null) {
      await _userSource.addDeviceId(user.uid, deviceId);
    }
  }
}
