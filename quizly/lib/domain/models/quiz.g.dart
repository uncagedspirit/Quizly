// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Quiz _$QuizFromJson(Map<String, dynamic> json) => _Quiz(
      id: json['id'] as String,
      code: json['code'] as String,
      creatorId: json['creator_id'] as String,
      creatorName: json['creator_name'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      categoryEmoji: json['category_emoji'] as String?,
      category: json['category'] as String?,
      questionCount: (json['question_count'] as num).toInt(),
      settings: QuizSettings.fromJson(json['settings'] as Map<String, dynamic>),
      stats: QuizStats.fromJson(json['stats'] as Map<String, dynamic>),
      status: _statusFromJson(json['status'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$QuizToJson(_Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'creator_id': instance.creatorId,
      'creator_name': instance.creatorName,
      'title': instance.title,
      'description': instance.description,
      'category_emoji': instance.categoryEmoji,
      'category': instance.category,
      'question_count': instance.questionCount,
      'settings': instance.settings,
      'stats': instance.stats,
      'status': _statusToJson(instance.status),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_QuizSettings _$QuizSettingsFromJson(Map<String, dynamic> json) =>
    _QuizSettings(
      allowAnonymous: json['allow_anonymous'] as bool? ?? false,
      perQuestionTimerSec: (json['per_question_timer_sec'] as num?)?.toInt(),
      deadlineAt: const TimestampConverter().fromJson(json['deadline_at']),
      revealMode: json['reveal_mode'] == null
          ? RevealMode.atEnd
          : _revealFromJson(json['reveal_mode'] as String),
    );

Map<String, dynamic> _$QuizSettingsToJson(_QuizSettings instance) =>
    <String, dynamic>{
      'allow_anonymous': instance.allowAnonymous,
      'per_question_timer_sec': instance.perQuestionTimerSec,
      'deadline_at': const TimestampConverter().toJson(instance.deadlineAt),
      'reveal_mode': _revealToJson(instance.revealMode),
    };

_QuizStats _$QuizStatsFromJson(Map<String, dynamic> json) => _QuizStats(
      attemptCount: (json['attempt_count'] as num?)?.toInt() ?? 0,
      averageScore: (json['average_score'] as num?)?.toDouble() ?? 0.0,
      hardestQuestionIndex: (json['hardest_question_index'] as num?)?.toInt(),
    );

Map<String, dynamic> _$QuizStatsToJson(_QuizStats instance) =>
    <String, dynamic>{
      'attempt_count': instance.attemptCount,
      'average_score': instance.averageScore,
      'hardest_question_index': instance.hardestQuestionIndex,
    };
