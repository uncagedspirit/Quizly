// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Challenge {
  String get id;
  String get quizId;
  String get challengerAttemptId;
  String get challengerName;
  int get challengerScore;
  String get challengerScoreText;
  DateTime get createdAt;
  DateTime get expiresAt;
  List<String> get acceptedBy;

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChallengeCopyWith<Challenge> get copyWith =>
      _$ChallengeCopyWithImpl<Challenge>(this as Challenge, _$identity);

  /// Serializes this Challenge to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Challenge &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.challengerAttemptId, challengerAttemptId) ||
                other.challengerAttemptId == challengerAttemptId) &&
            (identical(other.challengerName, challengerName) ||
                other.challengerName == challengerName) &&
            (identical(other.challengerScore, challengerScore) ||
                other.challengerScore == challengerScore) &&
            (identical(other.challengerScoreText, challengerScoreText) ||
                other.challengerScoreText == challengerScoreText) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            const DeepCollectionEquality()
                .equals(other.acceptedBy, acceptedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      quizId,
      challengerAttemptId,
      challengerName,
      challengerScore,
      challengerScoreText,
      createdAt,
      expiresAt,
      const DeepCollectionEquality().hash(acceptedBy));

  @override
  String toString() {
    return 'Challenge(id: $id, quizId: $quizId, challengerAttemptId: $challengerAttemptId, challengerName: $challengerName, challengerScore: $challengerScore, challengerScoreText: $challengerScoreText, createdAt: $createdAt, expiresAt: $expiresAt, acceptedBy: $acceptedBy)';
  }
}

/// @nodoc
abstract mixin class $ChallengeCopyWith<$Res> {
  factory $ChallengeCopyWith(Challenge value, $Res Function(Challenge) _then) =
      _$ChallengeCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String quizId,
      String challengerAttemptId,
      String challengerName,
      int challengerScore,
      String challengerScoreText,
      DateTime createdAt,
      DateTime expiresAt,
      List<String> acceptedBy});
}

/// @nodoc
class _$ChallengeCopyWithImpl<$Res> implements $ChallengeCopyWith<$Res> {
  _$ChallengeCopyWithImpl(this._self, this._then);

  final Challenge _self;
  final $Res Function(Challenge) _then;

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quizId = null,
    Object? challengerAttemptId = null,
    Object? challengerName = null,
    Object? challengerScore = null,
    Object? challengerScoreText = null,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? acceptedBy = null,
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
      challengerAttemptId: null == challengerAttemptId
          ? _self.challengerAttemptId
          : challengerAttemptId // ignore: cast_nullable_to_non_nullable
              as String,
      challengerName: null == challengerName
          ? _self.challengerName
          : challengerName // ignore: cast_nullable_to_non_nullable
              as String,
      challengerScore: null == challengerScore
          ? _self.challengerScore
          : challengerScore // ignore: cast_nullable_to_non_nullable
              as int,
      challengerScoreText: null == challengerScoreText
          ? _self.challengerScoreText
          : challengerScoreText // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      acceptedBy: null == acceptedBy
          ? _self.acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Challenge implements Challenge {
  const _Challenge(
      {required this.id,
      required this.quizId,
      required this.challengerAttemptId,
      required this.challengerName,
      required this.challengerScore,
      required this.challengerScoreText,
      required this.createdAt,
      required this.expiresAt,
      final List<String> acceptedBy = const []})
      : _acceptedBy = acceptedBy;
  factory _Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  @override
  final String id;
  @override
  final String quizId;
  @override
  final String challengerAttemptId;
  @override
  final String challengerName;
  @override
  final int challengerScore;
  @override
  final String challengerScoreText;
  @override
  final DateTime createdAt;
  @override
  final DateTime expiresAt;
  final List<String> _acceptedBy;
  @override
  @JsonKey()
  List<String> get acceptedBy {
    if (_acceptedBy is EqualUnmodifiableListView) return _acceptedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_acceptedBy);
  }

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChallengeCopyWith<_Challenge> get copyWith =>
      __$ChallengeCopyWithImpl<_Challenge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChallengeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Challenge &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quizId, quizId) || other.quizId == quizId) &&
            (identical(other.challengerAttemptId, challengerAttemptId) ||
                other.challengerAttemptId == challengerAttemptId) &&
            (identical(other.challengerName, challengerName) ||
                other.challengerName == challengerName) &&
            (identical(other.challengerScore, challengerScore) ||
                other.challengerScore == challengerScore) &&
            (identical(other.challengerScoreText, challengerScoreText) ||
                other.challengerScoreText == challengerScoreText) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            const DeepCollectionEquality()
                .equals(other._acceptedBy, _acceptedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      quizId,
      challengerAttemptId,
      challengerName,
      challengerScore,
      challengerScoreText,
      createdAt,
      expiresAt,
      const DeepCollectionEquality().hash(_acceptedBy));

  @override
  String toString() {
    return 'Challenge(id: $id, quizId: $quizId, challengerAttemptId: $challengerAttemptId, challengerName: $challengerName, challengerScore: $challengerScore, challengerScoreText: $challengerScoreText, createdAt: $createdAt, expiresAt: $expiresAt, acceptedBy: $acceptedBy)';
  }
}

/// @nodoc
abstract mixin class _$ChallengeCopyWith<$Res>
    implements $ChallengeCopyWith<$Res> {
  factory _$ChallengeCopyWith(
          _Challenge value, $Res Function(_Challenge) _then) =
      __$ChallengeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String quizId,
      String challengerAttemptId,
      String challengerName,
      int challengerScore,
      String challengerScoreText,
      DateTime createdAt,
      DateTime expiresAt,
      List<String> acceptedBy});
}

/// @nodoc
class __$ChallengeCopyWithImpl<$Res> implements _$ChallengeCopyWith<$Res> {
  __$ChallengeCopyWithImpl(this._self, this._then);

  final _Challenge _self;
  final $Res Function(_Challenge) _then;

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? quizId = null,
    Object? challengerAttemptId = null,
    Object? challengerName = null,
    Object? challengerScore = null,
    Object? challengerScoreText = null,
    Object? createdAt = null,
    Object? expiresAt = null,
    Object? acceptedBy = null,
  }) {
    return _then(_Challenge(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quizId: null == quizId
          ? _self.quizId
          : quizId // ignore: cast_nullable_to_non_nullable
              as String,
      challengerAttemptId: null == challengerAttemptId
          ? _self.challengerAttemptId
          : challengerAttemptId // ignore: cast_nullable_to_non_nullable
              as String,
      challengerName: null == challengerName
          ? _self.challengerName
          : challengerName // ignore: cast_nullable_to_non_nullable
              as String,
      challengerScore: null == challengerScore
          ? _self.challengerScore
          : challengerScore // ignore: cast_nullable_to_non_nullable
              as int,
      challengerScoreText: null == challengerScoreText
          ? _self.challengerScoreText
          : challengerScoreText // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _self.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      acceptedBy: null == acceptedBy
          ? _self._acceptedBy
          : acceptedBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
