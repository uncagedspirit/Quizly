// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {

 String get uid => throw _privateConstructorUsedError; String get email => throw _privateConstructorUsedError; String? get displayName => throw _privateConstructorUsedError; String? get photoUrl => throw _privateConstructorUsedError; DateTime get createdAt => throw _privateConstructorUsedError; DateTime? get lastSeenAt => throw _privateConstructorUsedError; List<String> get deviceIds => throw _privateConstructorUsedError; AppUserPreferences get preferences => throw _privateConstructorUsedError; List<String> get fcmTokens => throw _privateConstructorUsedError;






/// Serializes this AppUser to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $AppUserCopyWith<$Res>  {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) = _$AppUserCopyWithImpl<$Res, AppUser>;
@useResult
$Res call({
 String uid, String email, String? displayName, String? photoUrl, DateTime createdAt, DateTime? lastSeenAt, List<String> deviceIds, AppUserPreferences preferences, List<String> fcmTokens
});


$AppUserPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res,$Val extends AppUser> implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? email = null,Object? displayName = freezed,Object? photoUrl = freezed,Object? createdAt = null,Object? lastSeenAt = freezed,Object? deviceIds = null,Object? preferences = null,Object? fcmTokens = null,}) {
  return _then(_value.copyWith(
uid: null == uid ? _value.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _value.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _value.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _value.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastSeenAt: freezed == lastSeenAt ? _value.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deviceIds: null == deviceIds ? _value.deviceIds : deviceIds // ignore: cast_nullable_to_non_nullable
as List<String>,preferences: null == preferences ? _value.preferences : preferences // ignore: cast_nullable_to_non_nullable
as AppUserPreferences,fcmTokens: null == fcmTokens ? _value.fcmTokens : fcmTokens // ignore: cast_nullable_to_non_nullable
as List<String>,
  )as $Val);
}
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUserPreferencesCopyWith<$Res> get preferences {
  
  return $AppUserPreferencesCopyWith<$Res>(_value.preferences, (value) {
    return _then(_value.copyWith(preferences: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(_$AppUserImpl value, $Res Function(_$AppUserImpl) then) = __$$AppUserImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String uid, String email, String? displayName, String? photoUrl, DateTime createdAt, DateTime? lastSeenAt, List<String> deviceIds, AppUserPreferences preferences, List<String> fcmTokens
});


@override $AppUserPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res> extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl> implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(_$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);


/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? email = null,Object? displayName = freezed,Object? photoUrl = freezed,Object? createdAt = null,Object? lastSeenAt = freezed,Object? deviceIds = null,Object? preferences = null,Object? fcmTokens = null,}) {
  return _then(_$AppUserImpl(
uid: null == uid ? _value.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _value.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _value.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _value.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastSeenAt: freezed == lastSeenAt ? _value.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deviceIds: null == deviceIds ? _value._deviceIds : deviceIds // ignore: cast_nullable_to_non_nullable
as List<String>,preferences: null == preferences ? _value.preferences : preferences // ignore: cast_nullable_to_non_nullable
as AppUserPreferences,fcmTokens: null == fcmTokens ? _value._fcmTokens : fcmTokens // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$AppUserImpl  implements _AppUser {
  const _$AppUserImpl({required this.uid, required this.email, this.displayName, this.photoUrl, required this.createdAt, this.lastSeenAt, final  List<String> deviceIds = const [], this.preferences = const AppUserPreferences(), final  List<String> fcmTokens = const []}): _deviceIds = deviceIds,_fcmTokens = fcmTokens;

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) => _$$AppUserImplFromJson(json);

@override final  String uid;
@override final  String email;
@override final  String? displayName;
@override final  String? photoUrl;
@override final  DateTime createdAt;
@override final  DateTime? lastSeenAt;
 final  List<String> _deviceIds;
@override@JsonKey() List<String> get deviceIds {
  if (_deviceIds is EqualUnmodifiableListView) return _deviceIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deviceIds);
}

@override@JsonKey() final  AppUserPreferences preferences;
 final  List<String> _fcmTokens;
@override@JsonKey() List<String> get fcmTokens {
  if (_fcmTokens is EqualUnmodifiableListView) return _fcmTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fcmTokens);
}


@override
String toString() {
  return 'AppUser(uid: $uid, email: $email, displayName: $displayName, photoUrl: $photoUrl, createdAt: $createdAt, lastSeenAt: $lastSeenAt, deviceIds: $deviceIds, preferences: $preferences, fcmTokens: $fcmTokens)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$AppUserImpl&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt)&&const DeepCollectionEquality().equals(other._deviceIds, _deviceIds)&&(identical(other.preferences, preferences) || other.preferences == preferences)&&const DeepCollectionEquality().equals(other._fcmTokens, _fcmTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,email,displayName,photoUrl,createdAt,lastSeenAt,const DeepCollectionEquality().hash(_deviceIds),preferences,const DeepCollectionEquality().hash(_fcmTokens));

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$AppUserImplCopyWith<_$AppUserImpl> get copyWith => __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$AppUserImplToJson(this, );
}
}


abstract class _AppUser implements AppUser {
  const factory _AppUser({required final  String uid, required final  String email, final  String? displayName, final  String? photoUrl, required final  DateTime createdAt, final  DateTime? lastSeenAt, final  List<String> deviceIds, final  AppUserPreferences preferences, final  List<String> fcmTokens}) = _$AppUserImpl;
  

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

@override String get uid;@override String get email;@override String? get displayName;@override String? get photoUrl;@override DateTime get createdAt;@override DateTime? get lastSeenAt;@override List<String> get deviceIds;@override AppUserPreferences get preferences;@override List<String> get fcmTokens;
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$AppUserImplCopyWith<_$AppUserImpl> get copyWith => throw _privateConstructorUsedError;

}

AppUserPreferences _$AppUserPreferencesFromJson(Map<String, dynamic> json) {
return _AppUserPreferences.fromJson(json);
}

/// @nodoc
mixin _$AppUserPreferences {

 String get theme => throw _privateConstructorUsedError; bool get notifyOnAttempt => throw _privateConstructorUsedError;






/// Serializes this AppUserPreferences to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of AppUserPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$AppUserPreferencesCopyWith<AppUserPreferences> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $AppUserPreferencesCopyWith<$Res>  {
  factory $AppUserPreferencesCopyWith(AppUserPreferences value, $Res Function(AppUserPreferences) then) = _$AppUserPreferencesCopyWithImpl<$Res, AppUserPreferences>;
@useResult
$Res call({
 String theme, bool notifyOnAttempt
});



}

/// @nodoc
class _$AppUserPreferencesCopyWithImpl<$Res,$Val extends AppUserPreferences> implements $AppUserPreferencesCopyWith<$Res> {
  _$AppUserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of AppUserPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? theme = null,Object? notifyOnAttempt = null,}) {
  return _then(_value.copyWith(
theme: null == theme ? _value.theme : theme // ignore: cast_nullable_to_non_nullable
as String,notifyOnAttempt: null == notifyOnAttempt ? _value.notifyOnAttempt : notifyOnAttempt // ignore: cast_nullable_to_non_nullable
as bool,
  )as $Val);
}

}


/// @nodoc
abstract class _$$AppUserPreferencesImplCopyWith<$Res> implements $AppUserPreferencesCopyWith<$Res> {
  factory _$$AppUserPreferencesImplCopyWith(_$AppUserPreferencesImpl value, $Res Function(_$AppUserPreferencesImpl) then) = __$$AppUserPreferencesImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String theme, bool notifyOnAttempt
});



}

/// @nodoc
class __$$AppUserPreferencesImplCopyWithImpl<$Res> extends _$AppUserPreferencesCopyWithImpl<$Res, _$AppUserPreferencesImpl> implements _$$AppUserPreferencesImplCopyWith<$Res> {
  __$$AppUserPreferencesImplCopyWithImpl(_$AppUserPreferencesImpl _value, $Res Function(_$AppUserPreferencesImpl) _then)
      : super(_value, _then);


/// Create a copy of AppUserPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? theme = null,Object? notifyOnAttempt = null,}) {
  return _then(_$AppUserPreferencesImpl(
theme: null == theme ? _value.theme : theme // ignore: cast_nullable_to_non_nullable
as String,notifyOnAttempt: null == notifyOnAttempt ? _value.notifyOnAttempt : notifyOnAttempt // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$AppUserPreferencesImpl  implements _AppUserPreferences {
  const _$AppUserPreferencesImpl({this.theme = 'system', this.notifyOnAttempt = true});

  factory _$AppUserPreferencesImpl.fromJson(Map<String, dynamic> json) => _$$AppUserPreferencesImplFromJson(json);

@override@JsonKey() final  String theme;
@override@JsonKey() final  bool notifyOnAttempt;

@override
String toString() {
  return 'AppUserPreferences(theme: $theme, notifyOnAttempt: $notifyOnAttempt)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$AppUserPreferencesImpl&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.notifyOnAttempt, notifyOnAttempt) || other.notifyOnAttempt == notifyOnAttempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,theme,notifyOnAttempt);

/// Create a copy of AppUserPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$AppUserPreferencesImplCopyWith<_$AppUserPreferencesImpl> get copyWith => __$$AppUserPreferencesImplCopyWithImpl<_$AppUserPreferencesImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$AppUserPreferencesImplToJson(this, );
}
}


abstract class _AppUserPreferences implements AppUserPreferences {
  const factory _AppUserPreferences({final  String theme, final  bool notifyOnAttempt}) = _$AppUserPreferencesImpl;
  

  factory _AppUserPreferences.fromJson(Map<String, dynamic> json) = _$AppUserPreferencesImpl.fromJson;

@override String get theme;@override bool get notifyOnAttempt;
/// Create a copy of AppUserPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$AppUserPreferencesImplCopyWith<_$AppUserPreferencesImpl> get copyWith => throw _privateConstructorUsedError;

}
