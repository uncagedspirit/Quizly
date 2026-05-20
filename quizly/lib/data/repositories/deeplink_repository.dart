import '../../sources/remote/branch_source.dart';

class DeeplinkRepository {
  DeeplinkRepository(this._branchSource);

  final BranchSource _branchSource;

  Future<void> init() => _branchSource.init();
  Stream<DeeplinkData> get linkStream => _branchSource.linkStream;

  Future<String> generateQuizLink({
    required String quizId,
    required String quizCode,
    required String quizTitle,
  }) => _branchSource.generateQuizLink(
        quizId: quizId,
        quizCode: quizCode,
        quizTitle: quizTitle,
      );

  Future<String> generateChallengeLink({
    required String challengeId,
    required String quizId,
    required String quizTitle,
    required String challengerName,
    required String challengerScoreText,
  }) => _branchSource.generateChallengeLink(
        challengeId: challengeId,
        quizId: quizId,
        quizTitle: quizTitle,
        challengerName: challengerName,
        challengerScoreText: challengerScoreText,
      );

  void dispose() => _branchSource.dispose();
}
