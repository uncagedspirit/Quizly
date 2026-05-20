// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppUser {
  String get uid;
  String get email;
  String? get displayName;
  String? get photoUrl;
  DateTime get createdAt;
  DateTime? get lastSeenAt;
  List<String> get deviceIds;
  AppUserPreferences get preferences;
  List<String> get fcmTokens;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<AppUser> get copyWith =>
      _$AppUserCopyWithImpl<AppUser>(this as AppUser, _$identity);

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastSeenAt, lastSeenAt) ||
                other.lastSeenAt == lastSeenAt) &&
            const DeepCollectionEquality().equals(other.deviceIds, deviceIds) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            const DeepCollectionEquality().equals(other.fcmTokens, fcmTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      email,
      displayName,
      photoUrl,
      createdAt,
      lastSeenAt,
      const DeepCollectionEquality().hash(deviceIds),
      preferences,
      const DeepCollectionEquality().hash(fcmTokens));

  @override
  String toString() {
    return 'AppUser(uid: $uid, email: $email, displayName: $displayName, photoUrl: $photoUrl, createdAt: $createdAt, lastSeenAt: $lastSeenAt, deviceIds: $deviceIds, preferences: $preferences, fcmTokens: $fcmTokens)';
  }
}

/// @nodoc
abstract mixin class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) _then) =
      _$AppUserCopyWithImpl;
  @useResult
  $Res call(
      {String uid,
      String email,
      String? displayName,
      String? photoUrl,
      DateTime createdAt,
      DateTime? lastSeenAt,
      List<String> deviceIds,
      AppUserPreferences preferences,
      List<String> fcmTokens});

  $AppUserPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res> implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._self, this._then);

  final AppUser _self;
  final $Res Function(AppUser) _then;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = null,
    Object? lastSeenAt = freezed,
    Object? deviceIds = null,
    Object? preferences = null,
    Object? fcmTokens = null,
  }) {
    return _then(_self.copyWith(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastSeenAt: freezed == lastSeenAt
          ? _self.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deviceIds: null == deviceIds
          ? _self.deviceIds
          : deviceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferences: null == preferences
          ? _self.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as AppUserPreferences,
      fcmTokens: null == fcmTokens
          ? _self.fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserPreferencesCopyWith<$Res> get preferences {
    return $AppUserPreferencesCopyWith<$Res>(_self.preferences, (value) {
      return _then(_self.copyWith(preferences: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _AppUser implements AppUser {
  const _AppUser(
      {required this.uid,
      required this.email,
      this.displayName,
      this.photoUrl,
      required this.createdAt,
      this.lastSeenAt,
      final List<String> deviceIds = const [],
      this.preferences = const AppUserPreferences(),
      final List<String> fcmTokens = const []})
      : _deviceIds = deviceIds,
        _fcmTokens = fcmTokens;
  factory _AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final DateTime createdAt;
  @override
  final DateTime? lastSeenAt;
  final List<String> _deviceIds;
  @override
  @JsonKey()
  List<String> get deviceIds {
    if (_deviceIds is EqualUnmodifiableListView) return _deviceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deviceIds);
  }

  @override
  @JsonKey()
  final AppUserPreferences preferences;
  final List<String> _fcmTokens;
  @override
  @JsonKey()
  List<String> get fcmTokens {
    if (_fcmTokens is EqualUnmodifiableListView) return _fcmTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fcmTokens);
  }

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppUserCopyWith<_AppUser> get copyWith =>
      __$AppUserCopyWithImpl<_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastSeenAt, lastSeenAt) ||
                other.lastSeenAt == lastSeenAt) &&
            const DeepCollectionEquality()
                .equals(other._deviceIds, _deviceIds) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            const DeepCollectionEquality()
                .equals(other._fcmTokens, _fcmTokens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      email,
      displayName,
      photoUrl,
      createdAt,
      lastSeenAt,
      const DeepCollectionEquality().hash(_deviceIds),
      preferences,
      const DeepCollectionEquality().hash(_fcmTokens));

  @override
  String toString() {
    return 'AppUser(uid: $uid, email: $email, displayName: $displayName, photoUrl: $photoUrl, createdAt: $createdAt, lastSeenAt: $lastSeenAt, deviceIds: $deviceIds, preferences: $preferences, fcmTokens: $fcmTokens)';
  }
}

/// @nodoc
abstract mixin class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) _then) =
      __$AppUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String? displayName,
      String? photoUrl,
      DateTime createdAt,
      DateTime? lastSeenAt,
      List<String> deviceIds,
      AppUserPreferences preferences,
      List<String> fcmTokens});

  @override
  $AppUserPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class __$AppUserCopyWithImpl<$Res> implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(this._self, this._then);

  final _AppUser _self;
  final $Res Function(_AppUser) _then;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = null,
    Object? lastSeenAt = freezed,
    Object? deviceIds = null,
    Object? preferences = null,
    Object? fcmTokens = null,
  }) {
    return _then(_AppUser(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastSeenAt: freezed == lastSeenAt
          ? _self.lastSeenAt
          : lastSeenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deviceIds: null == deviceIds
          ? _self._deviceIds
          : deviceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferences: null == preferences
          ? _self.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as AppUserPreferences,
      fcmTokens: null == fcmTokens
          ? _self._fcmTokens
          : fcmTokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserPreferencesCopyWith<$Res> get preferences {
    return $AppUserPreferencesCopyWith<$Res>(_self.preferences, (value) {
      return _then(_self.copyWith(preferences: value));
    });
  }
}

/// @nodoc
mixin _$AppUserPreferences {
  String get theme;
  bool get notifyOnAttempt;

  /// Create a copy of AppUserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppUserPreferencesCopyWith<AppUserPreferences> get copyWith =>
      _$AppUserPreferencesCopyWithImpl<AppUserPreferences>(
          this as AppUserPreferences, _$identity);

  /// Serializes this AppUserPreferences to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppUserPreferences &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.notifyOnAttempt, notifyOnAttempt) ||
                other.notifyOnAttempt == notifyOnAttempt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, theme, notifyOnAttempt);

  @override
  String toString() {
    return 'AppUserPreferences(theme: $theme, notifyOnAttempt: $notifyOnAttempt)';
  }
}

/// @nodoc
abstract mixin class $AppUserPreferencesCopyWith<$Res> {
  factory $AppUserPreferencesCopyWith(
          AppUserPreferences value, $Res Function(AppUserPreferences) _then) =
      _$AppUserPreferencesCopyWithImpl;
  @useResult
  $Res call({String theme, bool notifyOnAttempt});
}

/// @nodoc
class _$AppUserPreferencesCopyWithImpl<$Res>
    implements $AppUserPreferencesCopyWith<$Res> {
  _$AppUserPreferencesCopyWithImpl(this._self, this._then);

  final AppUserPreferences _self;
  final $Res Function(AppUserPreferences) _then;

  /// Create a copy of AppUserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? theme = null,
    Object? notifyOnAttempt = null,
  }) {
    return _then(_self.copyWith(
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      notifyOnAttempt: null == notifyOnAttempt
          ? _self.notifyOnAttempt
          : notifyOnAttempt // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AppUserPreferences implements AppUserPreferences {
  const _AppUserPreferences(
      {this.theme = 'system', this.notifyOnAttempt = true});
  factory _AppUserPreferences.fromJson(Map<String, dynamic> json) =>
      _$AppUserPreferencesFromJson(json);

  @override
  @JsonKey()
  final String theme;
  @override
  @JsonKey()
  final bool notifyOnAttempt;

  /// Create a copy of AppUserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppUserPreferencesCopyWith<_AppUserPreferences> get copyWith =>
      __$AppUserPreferencesCopyWithImpl<_AppUserPreferences>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AppUserPreferencesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppUserPreferences &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.notifyOnAttempt, notifyOnAttempt) ||
                other.notifyOnAttempt == notifyOnAttempt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, theme, notifyOnAttempt);

  @override
  String toString() {
    return 'AppUserPreferences(theme: $theme, notifyOnAttempt: $notifyOnAttempt)';
  }
}

/// @nodoc
abstract mixin class _$AppUserPreferencesCopyWith<$Res>
    implements $AppUserPreferencesCopyWith<$Res> {
  factory _$AppUserPreferencesCopyWith(
          _AppUserPreferences value, $Res Function(_AppUserPreferences) _then) =
      __$AppUserPreferencesCopyWithImpl;
  @override
  @useResult
  $Res call({String theme, bool notifyOnAttempt});
}

/// @nodoc
class __$AppUserPreferencesCopyWithImpl<$Res>
    implements _$AppUserPreferencesCopyWith<$Res> {
  __$AppUserPreferencesCopyWithImpl(this._self, this._then);

  final _AppUserPreferences _self;
  final $Res Function(_AppUserPreferences) _then;

  /// Create a copy of AppUserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? theme = null,
    Object? notifyOnAttempt = null,
  }) {
    return _then(_AppUserPreferences(
      theme: null == theme
          ? _self.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      notifyOnAttempt: null == notifyOnAttempt
          ? _self.notifyOnAttempt
          : notifyOnAttempt // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
