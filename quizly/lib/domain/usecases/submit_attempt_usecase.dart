import '../../../core/utils/result_calculator.dart';
import '../../../domain/models/attempt.dart';
import '../../../domain/models/quiz.dart';
import '../../../domain/enums/attempt_status.dart';
import '../../../data/repositories/attempt_repository.dart';
import '../../../data/repositories/quiz_repository.dart';

class SubmitAttemptUseCase {
  SubmitAttemptUseCase(this._attemptRepository, this._quizRepository);

  final AttemptRepository _attemptRepository;
  final QuizRepository _quizRepository;

  Future<Attempt> execute(Attempt attempt) async {
    final correct = ResultCalculator.correctCount(
      attempt.answers.map((a) => a.isCorrect).toList(),
    );
    final total = attempt.answers.length;
    final percentage = ResultCalculator.percentage(correct, total);
    final totalTimeMs = ResultCalculator.totalTimeMs(
      attempt.answers.map((a) => a.timeTakenMs).toList(),
    );

    final rankAbove = await _attemptRepository.getRankAbove(
      attempt.quizId,
      percentage,
    );
    final rank = ResultCalculator.rank(rankAbove);

    final submitted = attempt.copyWith(
      score: AttemptScore(
        correct: correct,
        total: total,
        percentage: percentage,
        totalTimeMs: totalTimeMs,
      ),
      rank: rank,
      status: AttemptStatus.submitted,
      submittedAt: DateTime.now(),
    );

    await _attemptRepository.updateAttempt(submitted);
    await _updateQuizStats(attempt.quizId, correct, total);

    return submitted;
  }

  Future<void> _updateQuizStats(
    String quizId,
    int correct,
    int total,
  ) async {
    final quiz = await _quizRepository.getQuizById(quizId);
    if (quiz == null) return;

    final newCount = quiz.stats.attemptCount + 1;
    final newAvg = ((quiz.stats.averageScore * quiz.stats.attemptCount) +
            (correct / total * 100)) /
        newCount;

    final newStats = quiz.stats.copyWith(
      attemptCount: newCount,
      averageScore: newAvg,
    );

    await _quizRepository.updateQuizStats(quizId, newStats);
  }
}
