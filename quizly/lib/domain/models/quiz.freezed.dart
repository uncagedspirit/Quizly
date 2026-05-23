// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Quiz _$QuizFromJson(Map<String, dynamic> json) {
return _Quiz.fromJson(json);
}

/// @nodoc
mixin _$Quiz {

 String get id => throw _privateConstructorUsedError; String get code => throw _privateConstructorUsedError; String get creatorId => throw _privateConstructorUsedError; String get creatorName => throw _privateConstructorUsedError; String get title => throw _privateConstructorUsedError; String? get description => throw _privateConstructorUsedError; String? get categoryEmoji => throw _privateConstructorUsedError; String? get category => throw _privateConstructorUsedError; int get questionCount => throw _privateConstructorUsedError; QuizSettings get settings => throw _privateConstructorUsedError; QuizStats get stats => throw _privateConstructorUsedError;@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) QuizStatus get status => throw _privateConstructorUsedError; DateTime get createdAt => throw _privateConstructorUsedError; DateTime get updatedAt => throw _privateConstructorUsedError;






/// Serializes this Quiz to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $QuizCopyWith<$Res>  {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) = _$QuizCopyWithImpl<$Res, Quiz>;
@useResult
$Res call({
 String id, String code, String creatorId, String creatorName, String title, String? description, String? categoryEmoji, String? category, int questionCount, QuizSettings settings, QuizStats stats,@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) QuizStatus status, DateTime createdAt, DateTime updatedAt
});


$QuizSettingsCopyWith<$Res> get settings;$QuizStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$QuizCopyWithImpl<$Res,$Val extends Quiz> implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? creatorId = null,Object? creatorName = null,Object? title = null,Object? description = freezed,Object? categoryEmoji = freezed,Object? category = freezed,Object? questionCount = null,Object? settings = null,Object? stats = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _value.code : code // ignore: cast_nullable_to_non_nullable
as String,creatorId: null == creatorId ? _value.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,creatorName: null == creatorName ? _value.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _value.description : description // ignore: cast_nullable_to_non_nullable
as String?,categoryEmoji: freezed == categoryEmoji ? _value.categoryEmoji : categoryEmoji // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _value.category : category // ignore: cast_nullable_to_non_nullable
as String?,questionCount: null == questionCount ? _value.questionCount : questionCount // ignore: cast_nullable_to_non_nullable
as int,settings: null == settings ? _value.settings : settings // ignore: cast_nullable_to_non_nullable
as QuizSettings,stats: null == stats ? _value.stats : stats // ignore: cast_nullable_to_non_nullable
as QuizStats,status: null == status ? _value.status : status // ignore: cast_nullable_to_non_nullable
as QuizStatus,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _value.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  )as $Val);
}
/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizSettingsCopyWith<$Res> get settings {
  
  return $QuizSettingsCopyWith<$Res>(_value.settings, (value) {
    return _then(_value.copyWith(settings: value) as $Val);
  });
}/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizStatsCopyWith<$Res> get stats {
  
  return $QuizStatsCopyWith<$Res>(_value.stats, (value) {
    return _then(_value.copyWith(stats: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$QuizImplCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$$QuizImplCopyWith(_$QuizImpl value, $Res Function(_$QuizImpl) then) = __$$QuizImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String id, String code, String creatorId, String creatorName, String title, String? description, String? categoryEmoji, String? category, int questionCount, QuizSettings settings, QuizStats stats,@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) QuizStatus status, DateTime createdAt, DateTime updatedAt
});


@override $QuizSettingsCopyWith<$Res> get settings;@override $QuizStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$QuizImplCopyWithImpl<$Res> extends _$QuizCopyWithImpl<$Res, _$QuizImpl> implements _$$QuizImplCopyWith<$Res> {
  __$$QuizImplCopyWithImpl(_$QuizImpl _value, $Res Function(_$QuizImpl) _then)
      : super(_value, _then);


/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? creatorId = null,Object? creatorName = null,Object? title = null,Object? description = freezed,Object? categoryEmoji = freezed,Object? category = freezed,Object? questionCount = null,Object? settings = null,Object? stats = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_$QuizImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _value.code : code // ignore: cast_nullable_to_non_nullable
as String,creatorId: null == creatorId ? _value.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,creatorName: null == creatorName ? _value.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _value.description : description // ignore: cast_nullable_to_non_nullable
as String?,categoryEmoji: freezed == categoryEmoji ? _value.categoryEmoji : categoryEmoji // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _value.category : category // ignore: cast_nullable_to_non_nullable
as String?,questionCount: null == questionCount ? _value.questionCount : questionCount // ignore: cast_nullable_to_non_nullable
as int,settings: null == settings ? _value.settings : settings // ignore: cast_nullable_to_non_nullable
as QuizSettings,stats: null == stats ? _value.stats : stats // ignore: cast_nullable_to_non_nullable
as QuizStats,status: null == status ? _value.status : status // ignore: cast_nullable_to_non_nullable
as QuizStatus,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _value.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$QuizImpl  implements _Quiz {
  const _$QuizImpl({required this.id, required this.code, required this.creatorId, required this.creatorName, required this.title, this.description, this.categoryEmoji, this.category, required this.questionCount, required this.settings, required this.stats, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) required this.status, required this.createdAt, required this.updatedAt});

  factory _$QuizImpl.fromJson(Map<String, dynamic> json) => _$$QuizImplFromJson(json);

@override final  String id;
@override final  String code;
@override final  String creatorId;
@override final  String creatorName;
@override final  String title;
@override final  String? description;
@override final  String? categoryEmoji;
@override final  String? category;
@override final  int questionCount;
@override final  QuizSettings settings;
@override final  QuizStats stats;
@override@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) final  QuizStatus status;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

@override
String toString() {
  return 'Quiz(id: $id, code: $code, creatorId: $creatorId, creatorName: $creatorName, title: $title, description: $description, categoryEmoji: $categoryEmoji, category: $category, questionCount: $questionCount, settings: $settings, stats: $stats, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$QuizImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryEmoji, categoryEmoji) || other.categoryEmoji == categoryEmoji)&&(identical(other.category, category) || other.category == category)&&(identical(other.questionCount, questionCount) || other.questionCount == questionCount)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,creatorId,creatorName,title,description,categoryEmoji,category,questionCount,settings,stats,status,createdAt,updatedAt);

/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$QuizImplCopyWith<_$QuizImpl> get copyWith => __$$QuizImplCopyWithImpl<_$QuizImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$QuizImplToJson(this, );
}
}


abstract class _Quiz implements Quiz {
  const factory _Quiz({required final  String id, required final  String code, required final  String creatorId, required final  String creatorName, required final  String title, final  String? description, final  String? categoryEmoji, final  String? category, required final  int questionCount, required final  QuizSettings settings, required final  QuizStats stats, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) required final  QuizStatus status, required final  DateTime createdAt, required final  DateTime updatedAt}) = _$QuizImpl;
  

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$QuizImpl.fromJson;

@override String get id;@override String get code;@override String get creatorId;@override String get creatorName;@override String get title;@override String? get description;@override String? get categoryEmoji;@override String? get category;@override int get questionCount;@override QuizSettings get settings;@override QuizStats get stats;@override@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) QuizStatus get status;@override DateTime get createdAt;@override DateTime get updatedAt;
/// Create a copy of Quiz
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$QuizImplCopyWith<_$QuizImpl> get copyWith => throw _privateConstructorUsedError;

}

QuizSettings _$QuizSettingsFromJson(Map<String, dynamic> json) {
return _QuizSettings.fromJson(json);
}

/// @nodoc
mixin _$QuizSettings {

 bool get allowAnonymous => throw _privateConstructorUsedError; int? get perQuestionTimerSec => throw _privateConstructorUsedError;@TimestampConverter() DateTime? get deadlineAt => throw _privateConstructorUsedError;@JsonKey(fromJson: _revealFromJson, toJson: _revealToJson) RevealMode get revealMode => throw _privateConstructorUsedError;






/// Serializes this QuizSettings to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of QuizSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$QuizSettingsCopyWith<QuizSettings> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $QuizSettingsCopyWith<$Res>  {
  factory $QuizSettingsCopyWith(QuizSettings value, $Res Function(QuizSettings) then) = _$QuizSettingsCopyWithImpl<$Res, QuizSettings>;
@useResult
$Res call({
 bool allowAnonymous, int? perQuestionTimerSec,@TimestampConverter() DateTime? deadlineAt,@JsonKey(fromJson: _revealFromJson, toJson: _revealToJson) RevealMode revealMode
});



}

/// @nodoc
class _$QuizSettingsCopyWithImpl<$Res,$Val extends QuizSettings> implements $QuizSettingsCopyWith<$Res> {
  _$QuizSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of QuizSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allowAnonymous = null,Object? perQuestionTimerSec = freezed,Object? deadlineAt = freezed,Object? revealMode = null,}) {
  return _then(_value.copyWith(
allowAnonymous: null == allowAnonymous ? _value.allowAnonymous : allowAnonymous // ignore: cast_nullable_to_non_nullable
as bool,perQuestionTimerSec: freezed == perQuestionTimerSec ? _value.perQuestionTimerSec : perQuestionTimerSec // ignore: cast_nullable_to_non_nullable
as int?,deadlineAt: freezed == deadlineAt ? _value.deadlineAt : deadlineAt // ignore: cast_nullable_to_non_nullable
as DateTime?,revealMode: null == revealMode ? _value.revealMode : revealMode // ignore: cast_nullable_to_non_nullable
as RevealMode,
  )as $Val);
}

}


/// @nodoc
abstract class _$$QuizSettingsImplCopyWith<$Res> implements $QuizSettingsCopyWith<$Res> {
  factory _$$QuizSettingsImplCopyWith(_$QuizSettingsImpl value, $Res Function(_$QuizSettingsImpl) then) = __$$QuizSettingsImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 bool allowAnonymous, int? perQuestionTimerSec,@TimestampConverter() DateTime? deadlineAt,@JsonKey(fromJson: _revealFromJson, toJson: _revealToJson) RevealMode revealMode
});



}

/// @nodoc
class __$$QuizSettingsImplCopyWithImpl<$Res> extends _$QuizSettingsCopyWithImpl<$Res, _$QuizSettingsImpl> implements _$$QuizSettingsImplCopyWith<$Res> {
  __$$QuizSettingsImplCopyWithImpl(_$QuizSettingsImpl _value, $Res Function(_$QuizSettingsImpl) _then)
      : super(_value, _then);


/// Create a copy of QuizSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allowAnonymous = null,Object? perQuestionTimerSec = freezed,Object? deadlineAt = freezed,Object? revealMode = null,}) {
  return _then(_$QuizSettingsImpl(
allowAnonymous: null == allowAnonymous ? _value.allowAnonymous : allowAnonymous // ignore: cast_nullable_to_non_nullable
as bool,perQuestionTimerSec: freezed == perQuestionTimerSec ? _value.perQuestionTimerSec : perQuestionTimerSec // ignore: cast_nullable_to_non_nullable
as int?,deadlineAt: freezed == deadlineAt ? _value.deadlineAt : deadlineAt // ignore: cast_nullable_to_non_nullable
as DateTime?,revealMode: null == revealMode ? _value.revealMode : revealMode // ignore: cast_nullable_to_non_nullable
as RevealMode,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$QuizSettingsImpl  implements _QuizSettings {
  const _$QuizSettingsImpl({this.allowAnonymous = false, this.perQuestionTimerSec, @TimestampConverter() this.deadlineAt, @JsonKey(fromJson: _revealFromJson, toJson: _revealToJson) this.revealMode = RevealMode.atEnd});

  factory _$QuizSettingsImpl.fromJson(Map<String, dynamic> json) => _$$QuizSettingsImplFromJson(json);

@override@JsonKey() final  bool allowAnonymous;
@override final  int? perQuestionTimerSec;
@override@TimestampConverter() final  DateTime? deadlineAt;
@override@JsonKey(fromJson: _revealFromJson, toJson: _revealToJson) final  RevealMode revealMode;

@override
String toString() {
  return 'QuizSettings(allowAnonymous: $allowAnonymous, perQuestionTimerSec: $perQuestionTimerSec, deadlineAt: $deadlineAt, revealMode: $revealMode)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$QuizSettingsImpl&&(identical(other.allowAnonymous, allowAnonymous) || other.allowAnonymous == allowAnonymous)&&(identical(other.perQuestionTimerSec, perQuestionTimerSec) || other.perQuestionTimerSec == perQuestionTimerSec)&&(identical(other.deadlineAt, deadlineAt) || other.deadlineAt == deadlineAt)&&(identical(other.revealMode, revealMode) || other.revealMode == revealMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allowAnonymous,perQuestionTimerSec,deadlineAt,revealMode);

/// Create a copy of QuizSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$QuizSettingsImplCopyWith<_$QuizSettingsImpl> get copyWith => __$$QuizSettingsImplCopyWithImpl<_$QuizSettingsImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$QuizSettingsImplToJson(this, );
}
}


abstract class _QuizSettings implements QuizSettings {
  const factory _QuizSettings({final  bool allowAnonymous, final  int? perQuestionTimerSec, @TimestampConverter() final  DateTime? deadlineAt, @JsonKey(fromJson: _revealFromJson, toJson: _revealToJson) final  RevealMode revealMode}) = _$QuizSettingsImpl;
  

  factory _QuizSettings.fromJson(Map<String, dynamic> json) = _$QuizSettingsImpl.fromJson;

@override bool get allowAnonymous;@override int? get perQuestionTimerSec;@override@TimestampConverter() DateTime? get deadlineAt;@override@JsonKey(fromJson: _revealFromJson, toJson: _revealToJson) RevealMode get revealMode;
/// Create a copy of QuizSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$QuizSettingsImplCopyWith<_$QuizSettingsImpl> get copyWith => throw _privateConstructorUsedError;

}

QuizStats _$QuizStatsFromJson(Map<String, dynamic> json) {
return _QuizStats.fromJson(json);
}

/// @nodoc
mixin _$QuizStats {

 int get attemptCount => throw _privateConstructorUsedError; double get averageScore => throw _privateConstructorUsedError; int? get hardestQuestionIndex => throw _privateConstructorUsedError;






/// Serializes this QuizStats to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of QuizStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$QuizStatsCopyWith<QuizStats> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $QuizStatsCopyWith<$Res>  {
  factory $QuizStatsCopyWith(QuizStats value, $Res Function(QuizStats) then) = _$QuizStatsCopyWithImpl<$Res, QuizStats>;
@useResult
$Res call({
 int attemptCount, double averageScore, int? hardestQuestionIndex
});



}

/// @nodoc
class _$QuizStatsCopyWithImpl<$Res,$Val extends QuizStats> implements $QuizStatsCopyWith<$Res> {
  _$QuizStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of QuizStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attemptCount = null,Object? averageScore = null,Object? hardestQuestionIndex = freezed,}) {
  return _then(_value.copyWith(
attemptCount: null == attemptCount ? _value.attemptCount : attemptCount // ignore: cast_nullable_to_non_nullable
as int,averageScore: null == averageScore ? _value.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as double,hardestQuestionIndex: freezed == hardestQuestionIndex ? _value.hardestQuestionIndex : hardestQuestionIndex // ignore: cast_nullable_to_non_nullable
as int?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$QuizStatsImplCopyWith<$Res> implements $QuizStatsCopyWith<$Res> {
  factory _$$QuizStatsImplCopyWith(_$QuizStatsImpl value, $Res Function(_$QuizStatsImpl) then) = __$$QuizStatsImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int attemptCount, double averageScore, int? hardestQuestionIndex
});



}

/// @nodoc
class __$$QuizStatsImplCopyWithImpl<$Res> extends _$QuizStatsCopyWithImpl<$Res, _$QuizStatsImpl> implements _$$QuizStatsImplCopyWith<$Res> {
  __$$QuizStatsImplCopyWithImpl(_$QuizStatsImpl _value, $Res Function(_$QuizStatsImpl) _then)
      : super(_value, _then);


/// Create a copy of QuizStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attemptCount = null,Object? averageScore = null,Object? hardestQuestionIndex = freezed,}) {
  return _then(_$QuizStatsImpl(
attemptCount: null == attemptCount ? _value.attemptCount : attemptCount // ignore: cast_nullable_to_non_nullable
as int,averageScore: null == averageScore ? _value.averageScore : averageScore // ignore: cast_nullable_to_non_nullable
as double,hardestQuestionIndex: freezed == hardestQuestionIndex ? _value.hardestQuestionIndex : hardestQuestionIndex // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$QuizStatsImpl  implements _QuizStats {
  const _$QuizStatsImpl({this.attemptCount = 0, this.averageScore = 0.0, this.hardestQuestionIndex});

  factory _$QuizStatsImpl.fromJson(Map<String, dynamic> json) => _$$QuizStatsImplFromJson(json);

@override@JsonKey() final  int attemptCount;
@override@JsonKey() final  double averageScore;
@override final  int? hardestQuestionIndex;

@override
String toString() {
  return 'QuizStats(attemptCount: $attemptCount, averageScore: $averageScore, hardestQuestionIndex: $hardestQuestionIndex)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$QuizStatsImpl&&(identical(other.attemptCount, attemptCount) || other.attemptCount == attemptCount)&&(identical(other.averageScore, averageScore) || other.averageScore == averageScore)&&(identical(other.hardestQuestionIndex, hardestQuestionIndex) || other.hardestQuestionIndex == hardestQuestionIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attemptCount,averageScore,hardestQuestionIndex);

/// Create a copy of QuizStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$QuizStatsImplCopyWith<_$QuizStatsImpl> get copyWith => __$$QuizStatsImplCopyWithImpl<_$QuizStatsImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$QuizStatsImplToJson(this, );
}
}


abstract class _QuizStats implements QuizStats {
  const factory _QuizStats({final  int attemptCount, final  double averageScore, final  int? hardestQuestionIndex}) = _$QuizStatsImpl;
  

  factory _QuizStats.fromJson(Map<String, dynamic> json) = _$QuizStatsImpl.fromJson;

@override int get attemptCount;@override double get averageScore;@override int? get hardestQuestionIndex;
/// Create a copy of QuizStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$QuizStatsImplCopyWith<_$QuizStatsImpl> get copyWith => throw _privateConstructorUsedError;

}
