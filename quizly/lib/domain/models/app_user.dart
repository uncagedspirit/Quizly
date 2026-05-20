import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@Freezed()
class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,
    required String email,
    String? displayName,
    String? photoUrl,
    required DateTime createdAt,
    DateTime? lastSeenAt,
    @Default([]) List<String> deviceIds,
    @Default(AppUserPreferences()) AppUserPreferences preferences,
    @Default([]) List<String> fcmTokens,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

@Freezed()
class AppUserPreferences with _$AppUserPreferences {
  const factory AppUserPreferences({
    @Default('system') String theme,
    @Default(true) bool notifyOnAttempt,
  }) = _AppUserPreferences;

  factory AppUserPreferences.fromJson(Map<String, dynamic> json) =>
      _$AppUserPreferencesFromJson(json);
}
