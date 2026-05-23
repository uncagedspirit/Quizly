// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['display_name'] as String?,
      photoUrl: json['photo_url'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      lastSeenAt: json['last_seen_at'] == null
          ? null
          : DateTime.parse(json['last_seen_at'] as String),
      deviceIds: (json['device_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      preferences: json['preferences'] == null
          ? const AppUserPreferences()
          : AppUserPreferences.fromJson(
              json['preferences'] as Map<String, dynamic>,),
      fcmTokens: (json['fcm_tokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'display_name': instance.displayName,
      'photo_url': instance.photoUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'last_seen_at': instance.lastSeenAt?.toIso8601String(),
      'device_ids': instance.deviceIds,
      'preferences': instance.preferences,
      'fcm_tokens': instance.fcmTokens,
    };

_$AppUserPreferencesImpl _$$AppUserPreferencesImplFromJson(
        Map<String, dynamic> json,) =>
    _$AppUserPreferencesImpl(
      theme: json['theme'] as String? ?? 'system',
      notifyOnAttempt: json['notify_on_attempt'] as bool? ?? true,
    );

Map<String, dynamic> _$$AppUserPreferencesImplToJson(
        _$AppUserPreferencesImpl instance,) =>
    <String, dynamic>{
      'theme': instance.theme,
      'notify_on_attempt': instance.notifyOnAttempt,
    };
