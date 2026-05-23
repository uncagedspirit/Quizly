// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attempt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttemptImpl _$$AttemptImplFromJson(Map<String, dynamic> json) =>
    _$AttemptImpl(
      id: json['id'] as String,
      quizId: json['quiz_id'] as String,
      quizCode: json['quiz_code'] as String,
      attempterId: json['attempter_id'] as String?,
      attempterName: json['attempter_name'] as String,
      deviceId: json['device_id'] as String,
      isAnonymous: json['is_anonymous'] as bool? ?? false,
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      score: AttemptScore.fromJson(json['score'] as Map<String, dynamic>),
      rank: (json['rank'] as num?)?.toInt(),
      status: _statusFromJson(json['status'] as String),
      startedAt: DateTime.parse(json['started_at'] as String),
      submittedAt: json['submitted_at'] == null
          ? null
          : DateTime.parse(json['submitted_at'] as String),
      challengerAttemptId: json['challenger_attempt_id'] as String?,
    );

Map<String, dynamic> _$$AttemptImplToJson(_$AttemptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quiz_id': instance.quizId,
      'quiz_code': instance.quizCode,
      'attempter_id': instance.attempterId,
      'attempter_name': instance.attempterName,
      'device_id': instance.deviceId,
      'is_anonymous': instance.isAnonymous,
      'answers': instance.answers,
      'score': instance.score,
      'rank': instance.rank,
      'status': _statusToJson(instance.status),
      'started_at': instance.startedAt.toIso8601String(),
      'submitted_at': instance.submittedAt?.toIso8601String(),
      'challenger_attempt_id': instance.challengerAttemptId,
    };

_$AnswerImpl _$$AnswerImplFromJson(Map<String, dynamic> json) => _$AnswerImpl(
      questionId: json['question_id'] as String,
      selectedIndex: (json['selected_index'] as num?)?.toInt(),
      isCorrect: json['is_correct'] as bool? ?? false,
      timeTakenMs: (json['time_taken_ms'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$AnswerImplToJson(_$AnswerImpl instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'selected_index': instance.selectedIndex,
      'is_correct': instance.isCorrect,
      'time_taken_ms': instance.timeTakenMs,
    };

_$AttemptScoreImpl _$$AttemptScoreImplFromJson(Map<String, dynamic> json) =>
    _$AttemptScoreImpl(
      correct: (json['correct'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      percentage: (json['percentage'] as num).toInt(),
      totalTimeMs: (json['totalTimeMs'] as num).toInt(),
    );

Map<String, dynamic> _$$AttemptScoreImplToJson(_$AttemptScoreImpl instance) =>
    <String, dynamic>{
      'correct': instance.correct,
      'total': instance.total,
      'percentage': instance.percentage,
      'totalTimeMs': instance.totalTimeMs,
    };
