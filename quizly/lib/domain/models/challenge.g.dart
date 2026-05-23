// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChallengeImpl _$$ChallengeImplFromJson(Map<String, dynamic> json) =>
    _$ChallengeImpl(
      id: json['id'] as String,
      quizId: json['quiz_id'] as String,
      challengerAttemptId: json['challenger_attempt_id'] as String,
      challengerName: json['challenger_name'] as String,
      challengerScore: (json['challenger_score'] as num).toInt(),
      challengerScoreText: json['challenger_score_text'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      expiresAt: DateTime.parse(json['expires_at'] as String),
      acceptedBy: (json['accepted_by'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChallengeImplToJson(_$ChallengeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quiz_id': instance.quizId,
      'challenger_attempt_id': instance.challengerAttemptId,
      'challenger_name': instance.challengerName,
      'challenger_score': instance.challengerScore,
      'challenger_score_text': instance.challengerScoreText,
      'created_at': instance.createdAt.toIso8601String(),
      'expires_at': instance.expiresAt.toIso8601String(),
      'accepted_by': instance.acceptedBy,
    };
