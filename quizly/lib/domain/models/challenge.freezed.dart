// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Challenge _$ChallengeFromJson(Map<String, dynamic> json) {
return _Challenge.fromJson(json);
}

/// @nodoc
mixin _$Challenge {

 String get id => throw _privateConstructorUsedError; String get quizId => throw _privateConstructorUsedError; String get challengerAttemptId => throw _privateConstructorUsedError; String get challengerName => throw _privateConstructorUsedError; int get challengerScore => throw _privateConstructorUsedError; String get challengerScoreText => throw _privateConstructorUsedError; DateTime get createdAt => throw _privateConstructorUsedError; DateTime get expiresAt => throw _privateConstructorUsedError; List<String> get acceptedBy => throw _privateConstructorUsedError;






/// Serializes this Challenge to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$ChallengeCopyWith<Challenge> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ChallengeCopyWith<$Res>  {
  factory $ChallengeCopyWith(Challenge value, $Res Function(Challenge) then) = _$ChallengeCopyWithImpl<$Res, Challenge>;
@useResult
$Res call({
 String id, String quizId, String challengerAttemptId, String challengerName, int challengerScore, String challengerScoreText, DateTime createdAt, DateTime expiresAt, List<String> acceptedBy
});



}

/// @nodoc
class _$ChallengeCopyWithImpl<$Res,$Val extends Challenge> implements $ChallengeCopyWith<$Res> {
  _$ChallengeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? quizId = null,Object? challengerAttemptId = null,Object? challengerName = null,Object? challengerScore = null,Object? challengerScoreText = null,Object? createdAt = null,Object? expiresAt = null,Object? acceptedBy = null,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,quizId: null == quizId ? _value.quizId : quizId // ignore: cast_nullable_to_non_nullable
as String,challengerAttemptId: null == challengerAttemptId ? _value.challengerAttemptId : challengerAttemptId // ignore: cast_nullable_to_non_nullable
as String,challengerName: null == challengerName ? _value.challengerName : challengerName // ignore: cast_nullable_to_non_nullable
as String,challengerScore: null == challengerScore ? _value.challengerScore : challengerScore // ignore: cast_nullable_to_non_nullable
as int,challengerScoreText: null == challengerScoreText ? _value.challengerScoreText : challengerScoreText // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _value.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,acceptedBy: null == acceptedBy ? _value.acceptedBy : acceptedBy // ignore: cast_nullable_to_non_nullable
as List<String>,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ChallengeImplCopyWith<$Res> implements $ChallengeCopyWith<$Res> {
  factory _$$ChallengeImplCopyWith(_$ChallengeImpl value, $Res Function(_$ChallengeImpl) then) = __$$ChallengeImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String id, String quizId, String challengerAttemptId, String challengerName, int challengerScore, String challengerScoreText, DateTime createdAt, DateTime expiresAt, List<String> acceptedBy
});



}

/// @nodoc
class __$$ChallengeImplCopyWithImpl<$Res> extends _$ChallengeCopyWithImpl<$Res, _$ChallengeImpl> implements _$$ChallengeImplCopyWith<$Res> {
  __$$ChallengeImplCopyWithImpl(_$ChallengeImpl _value, $Res Function(_$ChallengeImpl) _then)
      : super(_value, _then);


/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? quizId = null,Object? challengerAttemptId = null,Object? challengerName = null,Object? challengerScore = null,Object? challengerScoreText = null,Object? createdAt = null,Object? expiresAt = null,Object? acceptedBy = null,}) {
  return _then(_$ChallengeImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,quizId: null == quizId ? _value.quizId : quizId // ignore: cast_nullable_to_non_nullable
as String,challengerAttemptId: null == challengerAttemptId ? _value.challengerAttemptId : challengerAttemptId // ignore: cast_nullable_to_non_nullable
as String,challengerName: null == challengerName ? _value.challengerName : challengerName // ignore: cast_nullable_to_non_nullable
as String,challengerScore: null == challengerScore ? _value.challengerScore : challengerScore // ignore: cast_nullable_to_non_nullable
as int,challengerScoreText: null == challengerScoreText ? _value.challengerScoreText : challengerScoreText // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _value.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _value.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,acceptedBy: null == acceptedBy ? _value._acceptedBy : acceptedBy // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$ChallengeImpl  implements _Challenge {
  const _$ChallengeImpl({required this.id, required this.quizId, required this.challengerAttemptId, required this.challengerName, required this.challengerScore, required this.challengerScoreText, required this.createdAt, required this.expiresAt, final  List<String> acceptedBy = const []}): _acceptedBy = acceptedBy;

  factory _$ChallengeImpl.fromJson(Map<String, dynamic> json) => _$$ChallengeImplFromJson(json);

@override final  String id;
@override final  String quizId;
@override final  String challengerAttemptId;
@override final  String challengerName;
@override final  int challengerScore;
@override final  String challengerScoreText;
@override final  DateTime createdAt;
@override final  DateTime expiresAt;
 final  List<String> _acceptedBy;
@override@JsonKey() List<String> get acceptedBy {
  if (_acceptedBy is EqualUnmodifiableListView) return _acceptedBy;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_acceptedBy);
}


@override
String toString() {
  return 'Challenge(id: $id, quizId: $quizId, challengerAttemptId: $challengerAttemptId, challengerName: $challengerName, challengerScore: $challengerScore, challengerScoreText: $challengerScoreText, createdAt: $createdAt, expiresAt: $expiresAt, acceptedBy: $acceptedBy)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ChallengeImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.quizId, quizId) || other.quizId == quizId)&&(identical(other.challengerAttemptId, challengerAttemptId) || other.challengerAttemptId == challengerAttemptId)&&(identical(other.challengerName, challengerName) || other.challengerName == challengerName)&&(identical(other.challengerScore, challengerScore) || other.challengerScore == challengerScore)&&(identical(other.challengerScoreText, challengerScoreText) || other.challengerScoreText == challengerScoreText)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&const DeepCollectionEquality().equals(other._acceptedBy, _acceptedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,quizId,challengerAttemptId,challengerName,challengerScore,challengerScoreText,createdAt,expiresAt,const DeepCollectionEquality().hash(_acceptedBy));

/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ChallengeImplCopyWith<_$ChallengeImpl> get copyWith => __$$ChallengeImplCopyWithImpl<_$ChallengeImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$ChallengeImplToJson(this, );
}
}


abstract class _Challenge implements Challenge {
  const factory _Challenge({required final  String id, required final  String quizId, required final  String challengerAttemptId, required final  String challengerName, required final  int challengerScore, required final  String challengerScoreText, required final  DateTime createdAt, required final  DateTime expiresAt, final  List<String> acceptedBy}) = _$ChallengeImpl;
  

  factory _Challenge.fromJson(Map<String, dynamic> json) = _$ChallengeImpl.fromJson;

@override String get id;@override String get quizId;@override String get challengerAttemptId;@override String get challengerName;@override int get challengerScore;@override String get challengerScoreText;@override DateTime get createdAt;@override DateTime get expiresAt;@override List<String> get acceptedBy;
/// Create a copy of Challenge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$ChallengeImplCopyWith<_$ChallengeImpl> get copyWith => throw _privateConstructorUsedError;

}
