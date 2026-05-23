// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attempt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Attempt _$AttemptFromJson(Map<String, dynamic> json) {
return _Attempt.fromJson(json);
}

/// @nodoc
mixin _$Attempt {

 String get id => throw _privateConstructorUsedError; String get quizId => throw _privateConstructorUsedError; String get quizCode => throw _privateConstructorUsedError; String? get attempterId => throw _privateConstructorUsedError; String get attempterName => throw _privateConstructorUsedError; String get deviceId => throw _privateConstructorUsedError; bool get isAnonymous => throw _privateConstructorUsedError; List<Answer> get answers => throw _privateConstructorUsedError; AttemptScore get score => throw _privateConstructorUsedError; int? get rank => throw _privateConstructorUsedError;@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) AttemptStatus get status => throw _privateConstructorUsedError; DateTime get startedAt => throw _privateConstructorUsedError; DateTime? get submittedAt => throw _privateConstructorUsedError; String? get challengerAttemptId => throw _privateConstructorUsedError;






/// Serializes this Attempt to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Attempt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$AttemptCopyWith<Attempt> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $AttemptCopyWith<$Res>  {
  factory $AttemptCopyWith(Attempt value, $Res Function(Attempt) then) = _$AttemptCopyWithImpl<$Res, Attempt>;
@useResult
$Res call({
 String id, String quizId, String quizCode, String? attempterId, String attempterName, String deviceId, bool isAnonymous, List<Answer> answers, AttemptScore score, int? rank,@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) AttemptStatus status, DateTime startedAt, DateTime? submittedAt, String? challengerAttemptId
});


$AttemptScoreCopyWith<$Res> get score;
}

/// @nodoc
class _$AttemptCopyWithImpl<$Res,$Val extends Attempt> implements $AttemptCopyWith<$Res> {
  _$AttemptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Attempt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? quizId = null,Object? quizCode = null,Object? attempterId = freezed,Object? attempterName = null,Object? deviceId = null,Object? isAnonymous = null,Object? answers = null,Object? score = null,Object? rank = freezed,Object? status = null,Object? startedAt = null,Object? submittedAt = freezed,Object? challengerAttemptId = freezed,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,quizId: null == quizId ? _value.quizId : quizId // ignore: cast_nullable_to_non_nullable
as String,quizCode: null == quizCode ? _value.quizCode : quizCode // ignore: cast_nullable_to_non_nullable
as String,attempterId: freezed == attempterId ? _value.attempterId : attempterId // ignore: cast_nullable_to_non_nullable
as String?,attempterName: null == attempterName ? _value.attempterName : attempterName // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _value.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,isAnonymous: null == isAnonymous ? _value.isAnonymous : isAnonymous // ignore: cast_nullable_to_non_nullable
as bool,answers: null == answers ? _value.answers : answers // ignore: cast_nullable_to_non_nullable
as List<Answer>,score: null == score ? _value.score : score // ignore: cast_nullable_to_non_nullable
as AttemptScore,rank: freezed == rank ? _value.rank : rank // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _value.status : status // ignore: cast_nullable_to_non_nullable
as AttemptStatus,startedAt: null == startedAt ? _value.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,submittedAt: freezed == submittedAt ? _value.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,challengerAttemptId: freezed == challengerAttemptId ? _value.challengerAttemptId : challengerAttemptId // ignore: cast_nullable_to_non_nullable
as String?,
  )as $Val);
}
/// Create a copy of Attempt
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttemptScoreCopyWith<$Res> get score {
  
  return $AttemptScoreCopyWith<$Res>(_value.score, (value) {
    return _then(_value.copyWith(score: value) as $Val);
  });
}
}


/// @nodoc
abstract class _$$AttemptImplCopyWith<$Res> implements $AttemptCopyWith<$Res> {
  factory _$$AttemptImplCopyWith(_$AttemptImpl value, $Res Function(_$AttemptImpl) then) = __$$AttemptImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String id, String quizId, String quizCode, String? attempterId, String attempterName, String deviceId, bool isAnonymous, List<Answer> answers, AttemptScore score, int? rank,@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) AttemptStatus status, DateTime startedAt, DateTime? submittedAt, String? challengerAttemptId
});


@override $AttemptScoreCopyWith<$Res> get score;
}

/// @nodoc
class __$$AttemptImplCopyWithImpl<$Res> extends _$AttemptCopyWithImpl<$Res, _$AttemptImpl> implements _$$AttemptImplCopyWith<$Res> {
  __$$AttemptImplCopyWithImpl(_$AttemptImpl _value, $Res Function(_$AttemptImpl) _then)
      : super(_value, _then);


/// Create a copy of Attempt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? quizId = null,Object? quizCode = null,Object? attempterId = freezed,Object? attempterName = null,Object? deviceId = null,Object? isAnonymous = null,Object? answers = null,Object? score = null,Object? rank = freezed,Object? status = null,Object? startedAt = null,Object? submittedAt = freezed,Object? challengerAttemptId = freezed,}) {
  return _then(_$AttemptImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as String,quizId: null == quizId ? _value.quizId : quizId // ignore: cast_nullable_to_non_nullable
as String,quizCode: null == quizCode ? _value.quizCode : quizCode // ignore: cast_nullable_to_non_nullable
as String,attempterId: freezed == attempterId ? _value.attempterId : attempterId // ignore: cast_nullable_to_non_nullable
as String?,attempterName: null == attempterName ? _value.attempterName : attempterName // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _value.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,isAnonymous: null == isAnonymous ? _value.isAnonymous : isAnonymous // ignore: cast_nullable_to_non_nullable
as bool,answers: null == answers ? _value._answers : answers // ignore: cast_nullable_to_non_nullable
as List<Answer>,score: null == score ? _value.score : score // ignore: cast_nullable_to_non_nullable
as AttemptScore,rank: freezed == rank ? _value.rank : rank // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _value.status : status // ignore: cast_nullable_to_non_nullable
as AttemptStatus,startedAt: null == startedAt ? _value.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,submittedAt: freezed == submittedAt ? _value.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,challengerAttemptId: freezed == challengerAttemptId ? _value.challengerAttemptId : challengerAttemptId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$AttemptImpl  implements _Attempt {
  const _$AttemptImpl({required this.id, required this.quizId, required this.quizCode, this.attempterId, required this.attempterName, required this.deviceId, this.isAnonymous = false, final  List<Answer> answers = const [], required this.score, this.rank, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) required this.status, required this.startedAt, this.submittedAt, this.challengerAttemptId}): _answers = answers;

  factory _$AttemptImpl.fromJson(Map<String, dynamic> json) => _$$AttemptImplFromJson(json);

@override final  String id;
@override final  String quizId;
@override final  String quizCode;
@override final  String? attempterId;
@override final  String attempterName;
@override final  String deviceId;
@override@JsonKey() final  bool isAnonymous;
 final  List<Answer> _answers;
@override@JsonKey() List<Answer> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}

@override final  AttemptScore score;
@override final  int? rank;
@override@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) final  AttemptStatus status;
@override final  DateTime startedAt;
@override final  DateTime? submittedAt;
@override final  String? challengerAttemptId;

@override
String toString() {
  return 'Attempt(id: $id, quizId: $quizId, quizCode: $quizCode, attempterId: $attempterId, attempterName: $attempterName, deviceId: $deviceId, isAnonymous: $isAnonymous, answers: $answers, score: $score, rank: $rank, status: $status, startedAt: $startedAt, submittedAt: $submittedAt, challengerAttemptId: $challengerAttemptId)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$AttemptImpl&&(identical(other.id, id) || other.id == id)&&(identical(other.quizId, quizId) || other.quizId == quizId)&&(identical(other.quizCode, quizCode) || other.quizCode == quizCode)&&(identical(other.attempterId, attempterId) || other.attempterId == attempterId)&&(identical(other.attempterName, attempterName) || other.attempterName == attempterName)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.isAnonymous, isAnonymous) || other.isAnonymous == isAnonymous)&&const DeepCollectionEquality().equals(other._answers, _answers)&&(identical(other.score, score) || other.score == score)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.status, status) || other.status == status)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.challengerAttemptId, challengerAttemptId) || other.challengerAttemptId == challengerAttemptId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,quizId,quizCode,attempterId,attempterName,deviceId,isAnonymous,const DeepCollectionEquality().hash(_answers),score,rank,status,startedAt,submittedAt,challengerAttemptId);

/// Create a copy of Attempt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$AttemptImplCopyWith<_$AttemptImpl> get copyWith => __$$AttemptImplCopyWithImpl<_$AttemptImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$AttemptImplToJson(this, );
}
}


abstract class _Attempt implements Attempt {
  const factory _Attempt({required final  String id, required final  String quizId, required final  String quizCode, final  String? attempterId, required final  String attempterName, required final  String deviceId, final  bool isAnonymous, final  List<Answer> answers, required final  AttemptScore score, final  int? rank, @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) required final  AttemptStatus status, required final  DateTime startedAt, final  DateTime? submittedAt, final  String? challengerAttemptId}) = _$AttemptImpl;
  

  factory _Attempt.fromJson(Map<String, dynamic> json) = _$AttemptImpl.fromJson;

@override String get id;@override String get quizId;@override String get quizCode;@override String? get attempterId;@override String get attempterName;@override String get deviceId;@override bool get isAnonymous;@override List<Answer> get answers;@override AttemptScore get score;@override int? get rank;@override@JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) AttemptStatus get status;@override DateTime get startedAt;@override DateTime? get submittedAt;@override String? get challengerAttemptId;
/// Create a copy of Attempt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$AttemptImplCopyWith<_$AttemptImpl> get copyWith => throw _privateConstructorUsedError;

}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
return _Answer.fromJson(json);
}

/// @nodoc
mixin _$Answer {

 String get questionId => throw _privateConstructorUsedError; int? get selectedIndex => throw _privateConstructorUsedError; bool get isCorrect => throw _privateConstructorUsedError; int get timeTakenMs => throw _privateConstructorUsedError;






/// Serializes this Answer to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Answer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $AnswerCopyWith<$Res>  {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) = _$AnswerCopyWithImpl<$Res, Answer>;
@useResult
$Res call({
 String questionId, int? selectedIndex, bool isCorrect, int timeTakenMs
});



}

/// @nodoc
class _$AnswerCopyWithImpl<$Res,$Val extends Answer> implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Answer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionId = null,Object? selectedIndex = freezed,Object? isCorrect = null,Object? timeTakenMs = null,}) {
  return _then(_value.copyWith(
questionId: null == questionId ? _value.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,selectedIndex: freezed == selectedIndex ? _value.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int?,isCorrect: null == isCorrect ? _value.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,timeTakenMs: null == timeTakenMs ? _value.timeTakenMs : timeTakenMs // ignore: cast_nullable_to_non_nullable
as int,
  )as $Val);
}

}


/// @nodoc
abstract class _$$AnswerImplCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$AnswerImplCopyWith(_$AnswerImpl value, $Res Function(_$AnswerImpl) then) = __$$AnswerImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String questionId, int? selectedIndex, bool isCorrect, int timeTakenMs
});



}

/// @nodoc
class __$$AnswerImplCopyWithImpl<$Res> extends _$AnswerCopyWithImpl<$Res, _$AnswerImpl> implements _$$AnswerImplCopyWith<$Res> {
  __$$AnswerImplCopyWithImpl(_$AnswerImpl _value, $Res Function(_$AnswerImpl) _then)
      : super(_value, _then);


/// Create a copy of Answer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionId = null,Object? selectedIndex = freezed,Object? isCorrect = null,Object? timeTakenMs = null,}) {
  return _then(_$AnswerImpl(
questionId: null == questionId ? _value.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,selectedIndex: freezed == selectedIndex ? _value.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int?,isCorrect: null == isCorrect ? _value.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,timeTakenMs: null == timeTakenMs ? _value.timeTakenMs : timeTakenMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$AnswerImpl  implements _Answer {
  const _$AnswerImpl({required this.questionId, this.selectedIndex, this.isCorrect = false, this.timeTakenMs = 0});

  factory _$AnswerImpl.fromJson(Map<String, dynamic> json) => _$$AnswerImplFromJson(json);

@override final  String questionId;
@override final  int? selectedIndex;
@override@JsonKey() final  bool isCorrect;
@override@JsonKey() final  int timeTakenMs;

@override
String toString() {
  return 'Answer(questionId: $questionId, selectedIndex: $selectedIndex, isCorrect: $isCorrect, timeTakenMs: $timeTakenMs)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$AnswerImpl&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.timeTakenMs, timeTakenMs) || other.timeTakenMs == timeTakenMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,selectedIndex,isCorrect,timeTakenMs);

/// Create a copy of Answer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$AnswerImplCopyWith<_$AnswerImpl> get copyWith => __$$AnswerImplCopyWithImpl<_$AnswerImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$AnswerImplToJson(this, );
}
}


abstract class _Answer implements Answer {
  const factory _Answer({required final  String questionId, final  int? selectedIndex, final  bool isCorrect, final  int timeTakenMs}) = _$AnswerImpl;
  

  factory _Answer.fromJson(Map<String, dynamic> json) = _$AnswerImpl.fromJson;

@override String get questionId;@override int? get selectedIndex;@override bool get isCorrect;@override int get timeTakenMs;
/// Create a copy of Answer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$AnswerImplCopyWith<_$AnswerImpl> get copyWith => throw _privateConstructorUsedError;

}

AttemptScore _$AttemptScoreFromJson(Map<String, dynamic> json) {
return _AttemptScore.fromJson(json);
}

/// @nodoc
mixin _$AttemptScore {

 int get correct => throw _privateConstructorUsedError; int get total => throw _privateConstructorUsedError; int get percentage => throw _privateConstructorUsedError;@JsonKey(name: 'totalTimeMs') int get totalTimeMs => throw _privateConstructorUsedError;






/// Serializes this AttemptScore to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of AttemptScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$AttemptScoreCopyWith<AttemptScore> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $AttemptScoreCopyWith<$Res>  {
  factory $AttemptScoreCopyWith(AttemptScore value, $Res Function(AttemptScore) then) = _$AttemptScoreCopyWithImpl<$Res, AttemptScore>;
@useResult
$Res call({
 int correct, int total, int percentage,@JsonKey(name: 'totalTimeMs') int totalTimeMs
});



}

/// @nodoc
class _$AttemptScoreCopyWithImpl<$Res,$Val extends AttemptScore> implements $AttemptScoreCopyWith<$Res> {
  _$AttemptScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of AttemptScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? correct = null,Object? total = null,Object? percentage = null,Object? totalTimeMs = null,}) {
  return _then(_value.copyWith(
correct: null == correct ? _value.correct : correct // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _value.total : total // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _value.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,totalTimeMs: null == totalTimeMs ? _value.totalTimeMs : totalTimeMs // ignore: cast_nullable_to_non_nullable
as int,
  )as $Val);
}

}


/// @nodoc
abstract class _$$AttemptScoreImplCopyWith<$Res> implements $AttemptScoreCopyWith<$Res> {
  factory _$$AttemptScoreImplCopyWith(_$AttemptScoreImpl value, $Res Function(_$AttemptScoreImpl) then) = __$$AttemptScoreImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int correct, int total, int percentage,@JsonKey(name: 'totalTimeMs') int totalTimeMs
});



}

/// @nodoc
class __$$AttemptScoreImplCopyWithImpl<$Res> extends _$AttemptScoreCopyWithImpl<$Res, _$AttemptScoreImpl> implements _$$AttemptScoreImplCopyWith<$Res> {
  __$$AttemptScoreImplCopyWithImpl(_$AttemptScoreImpl _value, $Res Function(_$AttemptScoreImpl) _then)
      : super(_value, _then);


/// Create a copy of AttemptScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? correct = null,Object? total = null,Object? percentage = null,Object? totalTimeMs = null,}) {
  return _then(_$AttemptScoreImpl(
correct: null == correct ? _value.correct : correct // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _value.total : total // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _value.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,totalTimeMs: null == totalTimeMs ? _value.totalTimeMs : totalTimeMs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$AttemptScoreImpl  implements _AttemptScore {
  const _$AttemptScoreImpl({required this.correct, required this.total, required this.percentage, @JsonKey(name: 'totalTimeMs') required this.totalTimeMs});

  factory _$AttemptScoreImpl.fromJson(Map<String, dynamic> json) => _$$AttemptScoreImplFromJson(json);

@override final  int correct;
@override final  int total;
@override final  int percentage;
@override@JsonKey(name: 'totalTimeMs') final  int totalTimeMs;

@override
String toString() {
  return 'AttemptScore(correct: $correct, total: $total, percentage: $percentage, totalTimeMs: $totalTimeMs)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$AttemptScoreImpl&&(identical(other.correct, correct) || other.correct == correct)&&(identical(other.total, total) || other.total == total)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.totalTimeMs, totalTimeMs) || other.totalTimeMs == totalTimeMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,correct,total,percentage,totalTimeMs);

/// Create a copy of AttemptScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$AttemptScoreImplCopyWith<_$AttemptScoreImpl> get copyWith => __$$AttemptScoreImplCopyWithImpl<_$AttemptScoreImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$AttemptScoreImplToJson(this, );
}
}


abstract class _AttemptScore implements AttemptScore {
  const factory _AttemptScore({required final  int correct, required final  int total, required final  int percentage, @JsonKey(name: 'totalTimeMs') required final  int totalTimeMs}) = _$AttemptScoreImpl;
  

  factory _AttemptScore.fromJson(Map<String, dynamic> json) = _$AttemptScoreImpl.fromJson;

@override int get correct;@override int get total;@override int get percentage;@override@JsonKey(name: 'totalTimeMs') int get totalTimeMs;
/// Create a copy of AttemptScore
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$AttemptScoreImplCopyWith<_$AttemptScoreImpl> get copyWith => throw _privateConstructorUsedError;

}
