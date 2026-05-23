// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaderboardEntry _$LeaderboardEntryFromJson(Map<String, dynamic> json) {
return _LeaderboardEntry.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardEntry {

 String get attemptId => throw _privateConstructorUsedError; String get attempterName => throw _privateConstructorUsedError; int get score => throw _privateConstructorUsedError; int get percentage => throw _privateConstructorUsedError; int get totalTimeMs => throw _privateConstructorUsedError; int get rank => throw _privateConstructorUsedError; DateTime get submittedAt => throw _privateConstructorUsedError; bool get isCurrentUser => throw _privateConstructorUsedError;






/// Serializes this LeaderboardEntry to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$LeaderboardEntryCopyWith<LeaderboardEntry> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $LeaderboardEntryCopyWith<$Res>  {
  factory $LeaderboardEntryCopyWith(LeaderboardEntry value, $Res Function(LeaderboardEntry) then) = _$LeaderboardEntryCopyWithImpl<$Res, LeaderboardEntry>;
@useResult
$Res call({
 String attemptId, String attempterName, int score, int percentage, int totalTimeMs, int rank, DateTime submittedAt, bool isCurrentUser
});



}

/// @nodoc
class _$LeaderboardEntryCopyWithImpl<$Res,$Val extends LeaderboardEntry> implements $LeaderboardEntryCopyWith<$Res> {
  _$LeaderboardEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attemptId = null,Object? attempterName = null,Object? score = null,Object? percentage = null,Object? totalTimeMs = null,Object? rank = null,Object? submittedAt = null,Object? isCurrentUser = null,}) {
  return _then(_value.copyWith(
attemptId: null == attemptId ? _value.attemptId : attemptId // ignore: cast_nullable_to_non_nullable
as String,attempterName: null == attempterName ? _value.attempterName : attempterName // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _value.score : score // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _value.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,totalTimeMs: null == totalTimeMs ? _value.totalTimeMs : totalTimeMs // ignore: cast_nullable_to_non_nullable
as int,rank: null == rank ? _value.rank : rank // ignore: cast_nullable_to_non_nullable
as int,submittedAt: null == submittedAt ? _value.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isCurrentUser: null == isCurrentUser ? _value.isCurrentUser : isCurrentUser // ignore: cast_nullable_to_non_nullable
as bool,
  )as $Val);
}

}


/// @nodoc
abstract class _$$LeaderboardEntryImplCopyWith<$Res> implements $LeaderboardEntryCopyWith<$Res> {
  factory _$$LeaderboardEntryImplCopyWith(_$LeaderboardEntryImpl value, $Res Function(_$LeaderboardEntryImpl) then) = __$$LeaderboardEntryImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String attemptId, String attempterName, int score, int percentage, int totalTimeMs, int rank, DateTime submittedAt, bool isCurrentUser
});



}

/// @nodoc
class __$$LeaderboardEntryImplCopyWithImpl<$Res> extends _$LeaderboardEntryCopyWithImpl<$Res, _$LeaderboardEntryImpl> implements _$$LeaderboardEntryImplCopyWith<$Res> {
  __$$LeaderboardEntryImplCopyWithImpl(_$LeaderboardEntryImpl _value, $Res Function(_$LeaderboardEntryImpl) _then)
      : super(_value, _then);


/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attemptId = null,Object? attempterName = null,Object? score = null,Object? percentage = null,Object? totalTimeMs = null,Object? rank = null,Object? submittedAt = null,Object? isCurrentUser = null,}) {
  return _then(_$LeaderboardEntryImpl(
attemptId: null == attemptId ? _value.attemptId : attemptId // ignore: cast_nullable_to_non_nullable
as String,attempterName: null == attempterName ? _value.attempterName : attempterName // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _value.score : score // ignore: cast_nullable_to_non_nullable
as int,percentage: null == percentage ? _value.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,totalTimeMs: null == totalTimeMs ? _value.totalTimeMs : totalTimeMs // ignore: cast_nullable_to_non_nullable
as int,rank: null == rank ? _value.rank : rank // ignore: cast_nullable_to_non_nullable
as int,submittedAt: null == submittedAt ? _value.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isCurrentUser: null == isCurrentUser ? _value.isCurrentUser : isCurrentUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$LeaderboardEntryImpl  implements _LeaderboardEntry {
  const _$LeaderboardEntryImpl({required this.attemptId, required this.attempterName, required this.score, required this.percentage, required this.totalTimeMs, required this.rank, required this.submittedAt, this.isCurrentUser = false});

  factory _$LeaderboardEntryImpl.fromJson(Map<String, dynamic> json) => _$$LeaderboardEntryImplFromJson(json);

@override final  String attemptId;
@override final  String attempterName;
@override final  int score;
@override final  int percentage;
@override final  int totalTimeMs;
@override final  int rank;
@override final  DateTime submittedAt;
@override@JsonKey() final  bool isCurrentUser;

@override
String toString() {
  return 'LeaderboardEntry(attemptId: $attemptId, attempterName: $attempterName, score: $score, percentage: $percentage, totalTimeMs: $totalTimeMs, rank: $rank, submittedAt: $submittedAt, isCurrentUser: $isCurrentUser)';
}


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$LeaderboardEntryImpl&&(identical(other.attemptId, attemptId) || other.attemptId == attemptId)&&(identical(other.attempterName, attempterName) || other.attempterName == attempterName)&&(identical(other.score, score) || other.score == score)&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.totalTimeMs, totalTimeMs) || other.totalTimeMs == totalTimeMs)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.isCurrentUser, isCurrentUser) || other.isCurrentUser == isCurrentUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attemptId,attempterName,score,percentage,totalTimeMs,rank,submittedAt,isCurrentUser);

/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$LeaderboardEntryImplCopyWith<_$LeaderboardEntryImpl> get copyWith => __$$LeaderboardEntryImplCopyWithImpl<_$LeaderboardEntryImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$LeaderboardEntryImplToJson(this, );
}
}


abstract class _LeaderboardEntry implements LeaderboardEntry {
  const factory _LeaderboardEntry({required final  String attemptId, required final  String attempterName, required final  int score, required final  int percentage, required final  int totalTimeMs, required final  int rank, required final  DateTime submittedAt, final  bool isCurrentUser}) = _$LeaderboardEntryImpl;
  

  factory _LeaderboardEntry.fromJson(Map<String, dynamic> json) = _$LeaderboardEntryImpl.fromJson;

@override String get attemptId;@override String get attempterName;@override int get score;@override int get percentage;@override int get totalTimeMs;@override int get rank;@override DateTime get submittedAt;@override bool get isCurrentUser;
/// Create a copy of LeaderboardEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$LeaderboardEntryImplCopyWith<_$LeaderboardEntryImpl> get copyWith => throw _privateConstructorUsedError;

}
