import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge.freezed.dart';
part 'challenge.g.dart';

@Freezed()
class Challenge with _$Challenge {
  const factory Challenge({
    required String id,
    required String quizId,
    required String challengerAttemptId,
    required String challengerName,
    required int challengerScore,
    required String challengerScoreText,
    required DateTime createdAt,
    required DateTime expiresAt,
    @Default([]) List<String> acceptedBy,
  }) = _Challenge;

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);
}
