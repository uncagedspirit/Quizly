// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attempt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Attempt {
  String get id;
  String get quizId;
  String get quizCode;
  String? get attempterId;
  String get attempterName;
  String get deviceId;
  bool get isAnonymous;
  List<Answer> get answers;
  AttemptScore get score;
  int? get rank;
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  AttemptStatus get status;
  DateTime get startedAt;
  DateTime? get submittedAt;
  String? get challengerAttemptId;

  /// Create a copy of Attempt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AttemptCopyWith<Attempt> get copyWith =>
      _$AttemptCopyWithImpl<Attempt>(this as Attempt, _$identity);

  /// Serializes this Attempt to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Attempt &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.quizCode, quizCode) ||
                other.quizCode == quizCode) &&
            (identical(other.attempterId, attempterId) ||
                other.attempterId == attempterId) &&
            (identical(other.attempterName, attempterName) ||
                other.attempterName == attempterName) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            const DeepCollectionEquality().equals(other.answers, answers) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.challengerAttemptId, challengerAttemptId) ||
                other.challengerAttemptId == challengerAttemptId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      quizId,
      quizCode,
      attempterId,
      attempterName,
      deviceId,
      isAnonymous,
      const DeepCollectionEquality().hash(answers),
      score,
      rank,
      status,
      startedAt,
      submittedAt,
      challengerAttemptId);

  @override
  String toString() {
    return 'Attempt(id: $id, quizId: $quizId, quizCode: $quizCode, attempterId: $attempterId, attempterName: $attempterName, deviceId: $deviceId, isAnonymous: $isAnonymous, answers: $answers, score: $score, rank: $rank, status: $status, startedAt: $startedAt, submittedAt: $submittedAt, challengerAttemptId: $challengerAttemptId)';
  }
}

/// @nodoc
abstract mixin class $AttemptCopyWith<$Res> {
  factory $AttemptCopyWith(Attempt value, $Res Function(Attempt) _then) =
      _$AttemptCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String quizId,
      String quizCode,
      String? attempterId,
      String attempterName,
      String deviceId,
      bool isAnonymous,
      List<Answer> answers,
      AttemptScore score,
      int? rank,
      @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
      AttemptStatus status,
      DateTime startedAt,
      DateTime? submittedAt,
      String? challengerAttemptId});

  $AttemptScoreCopyWith<$Res> get score;
}

/// @nodoc
class _$AttemptCopyWithImpl<$Res> implements $AttemptCopyWith<$Res> {
  _$AttemptCopyWithImpl(this._self, this._then);

  final Attempt _self;
  final $Res Function(Attempt) _then;

  /// Create a copy of Attempt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quizId = null,
    Object? quizCode = null,
    Object? attempterId = freezed,
    Object? attempterName = null,
    Object? deviceId = null,
    Object? isAnonymous = null,
    Object? answers = null,
    Object? score = null,
    Object? rank = freezed,
    Object? status = null,
    Object? startedAt = null,
    Object? submittedAt = freezed,
    Object? challengerAttemptId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quizId: null == quizId
          ? _self.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      quizCode: null == quizCode
          ? _self.quizCode
          : quizCode // ignore: cast_nullable_to_non_nullable
              as String,
      attempterId: freezed == attempterId
          ? _self.attempterId
          : attempterId // ignore: cast_nullable_to_non_nullable
              as String?,
      attempterName: null == attempterName
          ? _self.attempterName
          : attempterName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      isAnonymous: null == isAnonymous
          ? _self.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      answers: null == answers
          ? _self.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as AttemptScore,
      rank: freezed == rank
          ? _self.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttemptStatus,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      submittedAt: freezed == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      challengerAttemptId: freezed == challengerAttemptId
          ? _self.challengerAttemptId
          : challengerAttemptId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Attempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttemptScoreCopyWith<$Res> get score {
    return $AttemptScoreCopyWith<$Res>(_self.score, (value) {
      return _then(_self.copyWith(score: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Attempt implements Attempt {
  const _Attempt(
      {required this.id,
      required this.quizId,
      required this.quizCode,
      this.attempterId,
      required this.attempterName,
      required this.deviceId,
      this.isAnonymous = false,
      final List<Answer> answers = const [],
      required this.score,
      this.rank,
      @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
      required this.status,
      required this.startedAt,
      this.submittedAt,
      this.challengerAttemptId})
      : _answers = answers;
  factory _Attempt.fromJson(Map<String, dynamic> json) =>
      _$AttemptFromJson(json);

  @override
  final String id;
  @override
  final String quizId;
  @override
  final String quizCode;
  @override
  final String? attempterId;
  @override
  final String attempterName;
  @override
  final String deviceId;
  @override
  @JsonKey()
  final bool isAnonymous;
  final List<Answer> _answers;
  @override
  @JsonKey()
  List<Answer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final AttemptScore score;
  @override
  final int? rank;
  @override
  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  final AttemptStatus status;
  @override
  final DateTime startedAt;
  @override
  final DateTime? submittedAt;
  @override
  final String? challengerAttemptId;

  /// Create a copy of Attempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AttemptCopyWith<_Attempt> get copyWith =>
      __$AttemptCopyWithImpl<_Attempt>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AttemptToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Attempt &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.quizCode, quizCode) ||
                other.quizCode == quizCode) &&
            (identical(other.attempterId, attempterId) ||
                other.attempterId == attempterId) &&
            (identical(other.attempterName, attempterName) ||
                other.attempterName == attempterName) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.challengerAttemptId, challengerAttemptId) ||
                other.challengerAttemptId == challengerAttemptId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      quizId,
      quizCode,
      attempterId,
      attempterName,
      deviceId,
      isAnonymous,
      const DeepCollectionEquality().hash(_answers),
      score,
      rank,
      status,
      startedAt,
      submittedAt,
      challengerAttemptId);

  @override
  String toString() {
    return 'Attempt(id: $id, quizId: $quizId, quizCode: $quizCode, attempterId: $attempterId, attempterName: $attempterName, deviceId: $deviceId, isAnonymous: $isAnonymous, answers: $answers, score: $score, rank: $rank, status: $status, startedAt: $startedAt, submittedAt: $submittedAt, challengerAttemptId: $challengerAttemptId)';
  }
}

/// @nodoc
abstract mixin class _$AttemptCopyWith<$Res> implements $AttemptCopyWith<$Res> {
  factory _$AttemptCopyWith(_Attempt value, $Res Function(_Attempt) _then) =
      __$AttemptCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String quizId,
      String quizCode,
      String? attempterId,
      String attempterName,
      String deviceId,
      bool isAnonymous,
      List<Answer> answers,
      AttemptScore score,
      int? rank,
      @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
      AttemptStatus status,
      DateTime startedAt,
      DateTime? submittedAt,
      String? challengerAttemptId});

  @override
  $AttemptScoreCopyWith<$Res> get score;
}

/// @nodoc
class __$AttemptCopyWithImpl<$Res> implements _$AttemptCopyWith<$Res> {
  __$AttemptCopyWithImpl(this._self, this._then);

  final _Attempt _self;
  final $Res Function(_Attempt) _then;

  /// Create a copy of Attempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? quizId = null,
    Object? quizCode = null,
    Object? attempterId = freezed,
    Object? attempterName = null,
    Object? deviceId = null,
    Object? isAnonymous = null,
    Object? answers = null,
    Object? score = null,
    Object? rank = freezed,
    Object? status = null,
    Object? startedAt = null,
    Object? submittedAt = freezed,
    Object? challengerAttemptId = freezed,
  }) {
    return _then(_Attempt(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quizId: null == quizId
          ? _self.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      quizCode: null == quizCode
          ? _self.quizCode
          : quizCode // ignore: cast_nullable_to_non_nullable
              as String,
      attempterId: freezed == attempterId
          ? _self.attempterId
          : attempterId // ignore: cast_nullable_to_non_nullable
              as String?,
      attempterName: null == attempterName
          ? _self.attempterName
          : attempterName // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      isAnonymous: null == isAnonymous
          ? _self.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      answers: null == answers
          ? _self._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as AttemptScore,
      rank: freezed == rank
          ? _self.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttemptStatus,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      submittedAt: freezed == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      challengerAttemptId: freezed == challengerAttemptId
          ? _self.challengerAttemptId
          : challengerAttemptId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Attempt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttemptScoreCopyWith<$Res> get score {
    return $AttemptScoreCopyWith<$Res>(_self.score, (value) {
      return _then(_self.copyWith(score: value));
    });
  }
}

/// @nodoc
mixin _$Answer {
  String get questionId;
  int? get selectedIndex;
  bool get isCorrect;
  int get timeTakenMs;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AnswerCopyWith<Answer> get copyWith =>
      _$AnswerCopyWithImpl<Answer>(this as Answer, _$identity);

  /// Serializes this Answer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Answer &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.timeTakenMs, timeTakenMs) ||
                other.timeTakenMs == timeTakenMs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, questionId, selectedIndex, isCorrect, timeTakenMs);

  @override
  String toString() {
    return 'Answer(questionId: $questionId, selectedIndex: $selectedIndex, isCorrect: $isCorrect, timeTakenMs: $timeTakenMs)';
  }
}

/// @nodoc
abstract mixin class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) _then) =
      _$AnswerCopyWithImpl;
  @useResult
  $Res call(
      {String questionId, int? selectedIndex, bool isCorrect, int timeTakenMs});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res> implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._self, this._then);

  final Answer _self;
  final $Res Function(Answer) _then;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? selectedIndex = freezed,
    Object? isCorrect = null,
    Object? timeTakenMs = null,
  }) {
    return _then(_self.copyWith(
      questionId: null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedIndex: freezed == selectedIndex
          ? _self.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      isCorrect: null == isCorrect
          ? _self.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      timeTakenMs: null == timeTakenMs
          ? _self.timeTakenMs
          : timeTakenMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Answer implements Answer {
  const _Answer(
      {required this.questionId,
      this.selectedIndex,
      this.isCorrect = false,
      this.timeTakenMs = 0});
  factory _Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  @override
  final String questionId;
  @override
  final int? selectedIndex;
  @override
  @JsonKey()
  final bool isCorrect;
  @override
  @JsonKey()
  final int timeTakenMs;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AnswerCopyWith<_Answer> get copyWith =>
      __$AnswerCopyWithImpl<_Answer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AnswerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Answer &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.timeTakenMs, timeTakenMs) ||
                other.timeTakenMs == timeTakenMs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, questionId, selectedIndex, isCorrect, timeTakenMs);

  @override
  String toString() {
    return 'Answer(questionId: $questionId, selectedIndex: $selectedIndex, isCorrect: $isCorrect, timeTakenMs: $timeTakenMs)';
  }
}

/// @nodoc
abstract mixin class _$AnswerCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$AnswerCopyWith(_Answer value, $Res Function(_Answer) _then) =
      __$AnswerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String questionId, int? selectedIndex, bool isCorrect, int timeTakenMs});
}

/// @nodoc
class __$AnswerCopyWithImpl<$Res> implements _$AnswerCopyWith<$Res> {
  __$AnswerCopyWithImpl(this._self, this._then);

  final _Answer _self;
  final $Res Function(_Answer) _then;

  /// Create a copy of Answer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? questionId = null,
    Object? selectedIndex = freezed,
    Object? isCorrect = null,
    Object? timeTakenMs = null,
  }) {
    return _then(_Answer(
      questionId: null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedIndex: freezed == selectedIndex
          ? _self.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      isCorrect: null == isCorrect
          ? _self.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      timeTakenMs: null == timeTakenMs
          ? _self.timeTakenMs
          : timeTakenMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$AttemptScore {
  int get correct;
  int get total;
  int get percentage;
  @JsonKey(name: 'totalTimeMs')
  int get totalTimeMs;

  /// Create a copy of AttemptScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AttemptScoreCopyWith<AttemptScore> get copyWith =>
      _$AttemptScoreCopyWithImpl<AttemptScore>(
          this as AttemptScore, _$identity);

  /// Serializes this AttemptScore to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AttemptScore &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.totalTimeMs, totalTimeMs) ||
                other.totalTimeMs == totalTimeMs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, correct, total, percentage, totalTimeMs);

  @override
  String toString() {
    return 'AttemptScore(correct: $correct, total: $total, percentage: $percentage, totalTimeMs: $totalTimeMs)';
  }
}

/// @nodoc
abstract mixin class $AttemptScoreCopyWith<$Res> {
  factory $AttemptScoreCopyWith(
          AttemptScore value, $Res Function(AttemptScore) _then) =
      _$AttemptScoreCopyWithImpl;
  @useResult
  $Res call(
      {int correct,
      int total,
      int percentage,
      @JsonKey(name: 'totalTimeMs') int totalTimeMs});
}

/// @nodoc
class _$AttemptScoreCopyWithImpl<$Res> implements $AttemptScoreCopyWith<$Res> {
  _$AttemptScoreCopyWithImpl(this._self, this._then);

  final AttemptScore _self;
  final $Res Function(AttemptScore) _then;

  /// Create a copy of AttemptScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correct = null,
    Object? total = null,
    Object? percentage = null,
    Object? totalTimeMs = null,
  }) {
    return _then(_self.copyWith(
      correct: null == correct
          ? _self.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int,
      totalTimeMs: null == totalTimeMs
          ? _self.totalTimeMs
          : totalTimeMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AttemptScore implements AttemptScore {
  const _AttemptScore(
      {required this.correct,
      required this.total,
      required this.percentage,
      @JsonKey(name: 'totalTimeMs') required this.totalTimeMs});
  factory _AttemptScore.fromJson(Map<String, dynamic> json) =>
      _$AttemptScoreFromJson(json);

  @override
  final int correct;
  @override
  final int total;
  @override
  final int percentage;
  @override
  @JsonKey(name: 'totalTimeMs')
  final int totalTimeMs;

  /// Create a copy of AttemptScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AttemptScoreCopyWith<_AttemptScore> get copyWith =>
      __$AttemptScoreCopyWithImpl<_AttemptScore>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AttemptScoreToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AttemptScore &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.totalTimeMs, totalTimeMs) ||
                other.totalTimeMs == totalTimeMs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, correct, total, percentage, totalTimeMs);

  @override
  String toString() {
    return 'AttemptScore(correct: $correct, total: $total, percentage: $percentage, totalTimeMs: $totalTimeMs)';
  }
}

/// @nodoc
abstract mixin class _$AttemptScoreCopyWith<$Res>
    implements $AttemptScoreCopyWith<$Res> {
  factory _$AttemptScoreCopyWith(
          _AttemptScore value, $Res Function(_AttemptScore) _then) =
      __$AttemptScoreCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int correct,
      int total,
      int percentage,
      @JsonKey(name: 'totalTimeMs') int totalTimeMs});
}

/// @nodoc
class __$AttemptScoreCopyWithImpl<$Res>
    implements _$AttemptScoreCopyWith<$Res> {
  __$AttemptScoreCopyWithImpl(this._self, this._then);

  final _AttemptScore _self;
  final $Res Function(_AttemptScore) _then;

  /// Create a copy of AttemptScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? correct = null,
    Object? total = null,
    Object? percentage = null,
    Object? totalTimeMs = null,
  }) {
    return _then(_AttemptScore(
      correct: null == correct
          ? _self.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int,
      totalTimeMs: null == totalTimeMs
          ? _self.totalTimeMs
          : totalTimeMs // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
