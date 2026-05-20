import '../../../domain/models/leaderboard_entry.dart';
import '../../../data/repositories/attempt_repository.dart';

class ComputeLeaderboardUseCase {
  ComputeLeaderboardUseCase(this._attemptRepository);

  final AttemptRepository _attemptRepository;

  Stream<List<LeaderboardEntry>> execute(String quizId) {
    return _attemptRepository.getLeaderboardStream(quizId);
  }
}
