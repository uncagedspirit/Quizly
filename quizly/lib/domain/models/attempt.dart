import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/attempt_status.dart';

part 'attempt.freezed.dart';
part 'attempt.g.dart';

@Freezed()
class Attempt with _$Attempt {
  const factory Attempt({
    required String id,
    required String quizId,
    required String quizCode,
    String? attempterId,
    required String attempterName,
    required String deviceId,
    @Default(false) bool isAnonymous,
    @Default([]) List<Answer> answers,
    required AttemptScore score,
    int? rank,
    @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
    required AttemptStatus status,
    required DateTime startedAt,
    DateTime? submittedAt,
    String? challengerAttemptId,
  }) = _Attempt;

  factory Attempt.fromJson(Map<String, dynamic> json) =>
      _$AttemptFromJson(json);
}

@Freezed()
class Answer with _$Answer {
  const factory Answer({
    required String questionId,
    int? selectedIndex,
    @Default(false) bool isCorrect,
    @Default(0) int timeTakenMs,
  }) = _Answer;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}

@Freezed()
class AttemptScore with _$AttemptScore {
  const factory AttemptScore({
    required int correct,
    required int total,
    required int percentage,
    @JsonKey(name: 'totalTimeMs') required int totalTimeMs,
  }) = _AttemptScore;

  factory AttemptScore.fromJson(Map<String, dynamic> json) =>
      _$AttemptScoreFromJson(json);
}

AttemptStatus _statusFromJson(String json) => AttemptStatus.values.byName(json);
String _statusToJson(AttemptStatus status) => status.name;
