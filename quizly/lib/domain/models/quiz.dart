import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../enums/quiz_status.dart';
import '../enums/reveal_mode.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@Freezed()
class Quiz with _$Quiz {
  const factory Quiz({
    required String id,
    required String code,
    required String creatorId,
    required String creatorName,
    required String title,
    String? description,
    String? categoryEmoji,
    String? category,
    required int questionCount,
    required QuizSettings settings,
    required QuizStats stats,
    @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
    required QuizStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Quiz;

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

@Freezed()
class QuizSettings with _$QuizSettings {
  const factory QuizSettings({
    @Default(false) bool allowAnonymous,
    int? perQuestionTimerSec,
    @TimestampConverter() DateTime? deadlineAt,
    @JsonKey(fromJson: _revealFromJson, toJson: _revealToJson)
    @Default(RevealMode.atEnd)
    RevealMode revealMode,
  }) = _QuizSettings;

  factory QuizSettings.fromJson(Map<String, dynamic> json) =>
      _$QuizSettingsFromJson(json);
}

@Freezed()
class QuizStats with _$QuizStats {
  const factory QuizStats({
    @Default(0) int attemptCount,
    @Default(0.0) double averageScore,
    int? hardestQuestionIndex,
  }) = _QuizStats;

  factory QuizStats.fromJson(Map<String, dynamic> json) =>
      _$QuizStatsFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime?, dynamic> {
  const TimestampConverter();

  @override
  DateTime? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is Timestamp) return json.toDate();
    if (json is String) return DateTime.tryParse(json);
    return null;
  }

  @override
  dynamic toJson(DateTime? object) {
    if (object == null) return null;
    return Timestamp.fromDate(object);
  }
}

QuizStatus _statusFromJson(String json) => QuizStatus.values.byName(json);
String _statusToJson(QuizStatus status) => status.name;
RevealMode _revealFromJson(String json) => RevealMode.values.byName(json);
String _revealToJson(RevealMode mode) => mode.name;
