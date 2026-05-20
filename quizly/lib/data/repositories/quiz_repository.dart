import '../../../domain/models/quiz.dart';
import '../../../domain/models/question.dart';
import '../../sources/remote/firestore_quiz_source.dart';
import '../../sources/local/local_quiz_source.dart';

class QuizRepository {
  QuizRepository(this._remoteSource, this._localSource);

  final FirestoreQuizSource _remoteSource;
  final LocalQuizSource _localSource;

  Future<String> createQuiz(Quiz quiz, List<Question> questions) async {
    final id = await _remoteSource.createQuiz(quiz, questions);
    await _localSource.cacheQuiz(quiz, questions);
    return id;
  }

  Future<void> updateQuiz(Quiz quiz) async {
    await _remoteSource.updateQuiz(quiz);
  }

  Future<void> deleteQuiz(String quizId) async {
    await _remoteSource.deleteQuiz(quizId);
    await _localSource.removeQuiz(quizId);
  }

  Future<Quiz?> getQuizById(String quizId) async {
    try {
      return await _remoteSource.getQuizById(quizId);
    } catch (_) {
      return _localSource.getCachedQuiz(quizId);
    }
  }

  Future<Quiz?> getQuizByCode(String code) async {
    return _remoteSource.getQuizByCode(code);
  }

  Future<List<Quiz>> getCreatorQuizzes(String creatorId) async {
    return _remoteSource.getCreatorQuizzes(creatorId);
  }

  Future<List<Question>> getQuestions(String quizId) async {
    return _remoteSource.getQuestions(quizId);
  }

  Future<bool> codeExists(String code) async {
    return _remoteSource.codeExists(code);
  }

  Future<void> updateQuizStats(String quizId, QuizStats stats) async {
    await _remoteSource.updateQuizStats(quizId, stats);
  }
}
