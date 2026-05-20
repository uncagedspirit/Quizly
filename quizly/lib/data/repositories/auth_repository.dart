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
  );

  final FirebaseAuthSource _authSource;
  final FirestoreUserSource _userSource;
  final LocalUserSource _localUserSource;

  User? get currentUser => _authSource.currentUser;
  Stream<User?> authStateChanges() => _authSource.authStateChanges();

  String? get deviceId => _localUserSource.deviceId;

  Future<void> signInWithGoogle() async {
    await _authSource.signInWithGoogle();
    await _ensureUserDoc();
  }

  Future<void> signInWithEmail(String email, String password) async {
    await _authSource.signInWithEmail(email, password);
    await _ensureUserDoc();
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
