import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/models/app_user.dart';
import '../../dtos/user_dto.dart';

class FirestoreUserSource {
  FirestoreUserSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference get _users => _firestore.collection('users');

  Future<void> createUser(AppUser user) async {
    await _users.doc(user.uid).set(UserDto.toFirestore(user));
  }

  Future<void> updateUser(AppUser user) async {
    await _users.doc(user.uid).update(UserDto.toFirestore(user));
  }

  Future<AppUser?> getUserById(String uid) async {
    final doc = await _users.doc(uid).get();
    if (!doc.exists) return null;
    return UserDto.fromFirestore(doc);
  }

  Future<void> updateLastSeen(String uid) async {
    await _users.doc(uid).update({
      'lastSeenAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updatePreferences(
    String uid,
    AppUserPreferences preferences,
  ) async {
    await _users.doc(uid).update({
      'preferences': {
        'theme': preferences.theme,
        'notifyOnAttempt': preferences.notifyOnAttempt,
      },
    });
  }

  Future<void> addDeviceId(String uid, String deviceId) async {
    await _users.doc(uid).update({
      'deviceIds': FieldValue.arrayUnion([deviceId]),
    });
  }
}
