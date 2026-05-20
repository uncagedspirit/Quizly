import '../../../domain/models/attempt.dart';
import '../../../domain/models/leaderboard_entry.dart';
import '../sources/remote/firestore_attempt_source.dart';
import '../sources/local/local_attempt_source.dart';

class AttemptRepository {
  AttemptRepository(this._remoteSource, this._localSource);

  final FirestoreAttemptSource _remoteSource;
  final LocalAttemptSource _localSource;

  Future<String> createAttempt(Attempt attempt) async {
    try {
      return await _remoteSource.createAttempt(attempt);
    } catch (_) {
      await _localSource.addPendingSubmission(attempt);
      rethrow;
    }
  }

  Future<void> updateAttempt(Attempt attempt) async {
    try {
      await _remoteSource.updateAttempt(attempt);
    } catch (_) {
      await _localSource.addPendingSubmission(attempt);
    }
  }

  Future<Attempt?> getAttemptById(String attemptId) async {
    return _remoteSource.getAttemptById(attemptId);
  }

  Future<List<Attempt>> getAttemptsByQuiz(String quizId) async {
    return _remoteSource.getAttemptsByQuiz(quizId);
  }

  Future<List<Attempt>> getAttemptsByUser(String userId) async {
    return _remoteSource.getAttemptsByUser(userId);
  }

  Future<List<Attempt>> getAttemptsByDevice(String deviceId) async {
    return _remoteSource.getAttemptsByDevice(deviceId);
  }

  Stream<List<LeaderboardEntry>> getLeaderboardStream(String quizId) {
    return _remoteSource.getLeaderboardStream(quizId);
  }

  Future<int> getRankAbove(String quizId, int percentage) async {
    return _remoteSource.getRankAbove(quizId, percentage);
  }

  Future<void> markAttemptAbandoned(String attemptId) async {
    await _remoteSource.markAttemptAbandoned(attemptId);
  }

  Future<List<Attempt>> getPendingSubmissions() async {
    return _localSource.getPendingSubmissions();
  }

  Future<void> flushPendingSubmissions() async {
    final pending = _localSource.getPendingSubmissions();
    for (final attempt in pending) {
      try {
        await _remoteSource.updateAttempt(attempt);
        await _localSource.removePendingSubmission(attempt.id);
      } catch (_) {}
    }
  }
}
