import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/models/app_user.dart';

class UserDto {
  UserDto._();

  static AppUser fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final prefs = data['preferences'] as Map<String, dynamic>?;

    return AppUser(
      uid: doc.id,
      email: data['email'] as String? ?? '',
      displayName: data['displayName'] as String?,
      photoUrl: data['photoUrl'] as String?,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      lastSeenAt: data['lastSeenAt'] != null
          ? (data['lastSeenAt'] as Timestamp).toDate()
          : null,
      deviceIds: List<String>.from(data['deviceIds'] as List<dynamic>? ?? []),
      preferences: AppUserPreferences(
        theme: prefs?['theme'] as String? ?? 'system',
        notifyOnAttempt: prefs?['notifyOnAttempt'] as bool? ?? true,
      ),
      fcmTokens: List<String>.from(data['fcmTokens'] as List<dynamic>? ?? []),
    );
  }

  static Map<String, dynamic> toFirestore(AppUser user) {
    return {
      'uid': user.uid,
      'email': user.email,
      'displayName': user.displayName,
      'photoUrl': user.photoUrl,
      'createdAt': FieldValue.serverTimestamp(),
      'lastSeenAt': FieldValue.serverTimestamp(),
      'deviceIds': user.deviceIds,
      'preferences': {
        'theme': user.preferences.theme,
        'notifyOnAttempt': user.preferences.notifyOnAttempt,
      },
      'fcmTokens': user.fcmTokens,
    };
  }
}
