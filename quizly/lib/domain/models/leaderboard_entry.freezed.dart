// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaderboardEntry {
  String get attemptId;
  String get attempterName;
  int get score;
  int get percentage;
  int get totalTimeMs;
  int get rank;
  DateTime get submittedAt;
  bool get isCurrentUser;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LeaderboardEntryCopyWith<LeaderboardEntry> get copyWith =>
      _$LeaderboardEntryCopyWithImpl<LeaderboardEntry>(
          this as LeaderboardEntry, _$identity);

  /// Serializes this LeaderboardEntry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LeaderboardEntry &&
            (identical(other.attemptId, attemptId) ||
                other.attemptId == attemptId) &&
            (identical(other.attempterName, attempterName) ||
                other.attempterName == attempterName) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.totalTimeMs, totalTimeMs) ||
                other.totalTimeMs == totalTimeMs) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                other.isCurrentUser == isCurrentUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attemptId, attempterName, score,
      percentage, totalTimeMs, rank, submittedAt, isCurrentUser);

  @override
  String toString() {
    return 'LeaderboardEntry(attemptId: $attemptId, attempterName: $attempterName, score: $score, percentage: $percentage, totalTimeMs: $totalTimeMs, rank: $rank, submittedAt: $submittedAt, isCurrentUser: $isCurrentUser)';
  }
}

/// @nodoc
abstract mixin class $LeaderboardEntryCopyWith<$Res> {
  factory $LeaderboardEntryCopyWith(
          LeaderboardEntry value, $Res Function(LeaderboardEntry) _then) =
      _$LeaderboardEntryCopyWithImpl;
  @useResult
  $Res call(
      {String attemptId,
      String attempterName,
      int score,
      int percentage,
      int totalTimeMs,
      int rank,
      DateTime submittedAt,
      bool isCurrentUser});
}

/// @nodoc
class _$LeaderboardEntryCopyWithImpl<$Res>
    implements $LeaderboardEntryCopyWith<$Res> {
  _$LeaderboardEntryCopyWithImpl(this._self, this._then);

  final LeaderboardEntry _self;
  final $Res Function(LeaderboardEntry) _then;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attemptId = null,
    Object? attempterName = null,
    Object? score = null,
    Object? percentage = null,
    Object? totalTimeMs = null,
    Object? rank = null,
    Object? submittedAt = null,
    Object? isCurrentUser = null,
  }) {
    return _then(_self.copyWith(
      attemptId: null == attemptId
          ? _self.attemptId
          : attemptId // ignore: cast_nullable_to_non_nullable
              as String,
      attempterName: null == attempterName
          ? _self.attempterName
          : attempterName // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int,
      totalTimeMs: null == totalTimeMs
          ? _self.totalTimeMs
          : totalTimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _self.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      submittedAt: null == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCurrentUser: null == isCurrentUser
          ? _self.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LeaderboardEntry implements LeaderboardEntry {
  const _LeaderboardEntry(
      {required this.attemptId,
      required this.attempterName,
      required this.score,
      required this.percentage,
      required this.totalTimeMs,
      required this.rank,
      required this.submittedAt,
      this.isCurrentUser = false});
  factory _LeaderboardEntry.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardEntryFromJson(json);

  @override
  final String attemptId;
  @override
  final String attempterName;
  @override
  final int score;
  @override
  final int percentage;
  @override
  final int totalTimeMs;
  @override
  final int rank;
  @override
  final DateTime submittedAt;
  @override
  @JsonKey()
  final bool isCurrentUser;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LeaderboardEntryCopyWith<_LeaderboardEntry> get copyWith =>
      __$LeaderboardEntryCopyWithImpl<_LeaderboardEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LeaderboardEntryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LeaderboardEntry &&
            (identical(other.attemptId, attemptId) ||
                other.attemptId == attemptId) &&
            (identical(other.attempterName, attempterName) ||
                other.attempterName == attempterName) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.totalTimeMs, totalTimeMs) ||
                other.totalTimeMs == totalTimeMs) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.submittedAt, submittedAt) ||
                other.submittedAt == submittedAt) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                other.isCurrentUser == isCurrentUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attemptId, attempterName, score,
      percentage, totalTimeMs, rank, submittedAt, isCurrentUser);

  @override
  String toString() {
    return 'LeaderboardEntry(attemptId: $attemptId, attempterName: $attempterName, score: $score, percentage: $percentage, totalTimeMs: $totalTimeMs, rank: $rank, submittedAt: $submittedAt, isCurrentUser: $isCurrentUser)';
  }
}

/// @nodoc
abstract mixin class _$LeaderboardEntryCopyWith<$Res>
    implements $LeaderboardEntryCopyWith<$Res> {
  factory _$LeaderboardEntryCopyWith(
          _LeaderboardEntry value, $Res Function(_LeaderboardEntry) _then) =
      __$LeaderboardEntryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String attemptId,
      String attempterName,
      int score,
      int percentage,
      int totalTimeMs,
      int rank,
      DateTime submittedAt,
      bool isCurrentUser});
}

/// @nodoc
class __$LeaderboardEntryCopyWithImpl<$Res>
    implements _$LeaderboardEntryCopyWith<$Res> {
  __$LeaderboardEntryCopyWithImpl(this._self, this._then);

  final _LeaderboardEntry _self;
  final $Res Function(_LeaderboardEntry) _then;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? attemptId = null,
    Object? attempterName = null,
    Object? score = null,
    Object? percentage = null,
    Object? totalTimeMs = null,
    Object? rank = null,
    Object? submittedAt = null,
    Object? isCurrentUser = null,
  }) {
    return _then(_LeaderboardEntry(
      attemptId: null == attemptId
          ? _self.attemptId
          : attemptId // ignore: cast_nullable_to_non_nullable
              as String,
      attempterName: null == attempterName
          ? _self.attempterName
          : attempterName // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _self.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int,
      totalTimeMs: null == totalTimeMs
          ? _self.totalTimeMs
          : totalTimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      rank: null == rank
          ? _self.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      submittedAt: null == submittedAt
          ? _self.submittedAt
          : submittedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCurrentUser: null == isCurrentUser
          ? _self.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
