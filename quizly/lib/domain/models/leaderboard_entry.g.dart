// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaderboardEntryImpl _$$LeaderboardEntryImplFromJson(
        Map<String, dynamic> json,) =>
    _$LeaderboardEntryImpl(
      attemptId: json['attempt_id'] as String,
      attempterName: json['attempter_name'] as String,
      score: (json['score'] as num).toInt(),
      percentage: (json['percentage'] as num).toInt(),
      totalTimeMs: (json['total_time_ms'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
      submittedAt: DateTime.parse(json['submitted_at'] as String),
      isCurrentUser: json['is_current_user'] as bool? ?? false,
    );

Map<String, dynamic> _$$LeaderboardEntryImplToJson(
        _$LeaderboardEntryImpl instance,) =>
    <String, dynamic>{
      'attempt_id': instance.attemptId,
      'attempter_name': instance.attempterName,
      'score': instance.score,
      'percentage': instance.percentage,
      'total_time_ms': instance.totalTimeMs,
      'rank': instance.rank,
      'submitted_at': instance.submittedAt.toIso8601String(),
      'is_current_user': instance.isCurrentUser,
    };
