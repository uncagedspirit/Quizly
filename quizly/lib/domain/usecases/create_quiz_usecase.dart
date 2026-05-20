import 'dart:math';

import '../../../core/utils/code_generator.dart';
import '../../../core/errors/app_exception.dart';
import '../../../domain/models/quiz.dart';
import '../../../domain/models/question.dart';
import '../../../domain/enums/quiz_status.dart';
import '../../../data/repositories/quiz_repository.dart';

class CreateQuizUseCase {
  CreateQuizUseCase(this._quizRepository);

  final QuizRepository _quizRepository;

  Future<String> execute(Quiz quiz, List<Question> questions) async {
    final code = await _generateUniqueCode();
    final id = quiz.id.isNotEmpty ? quiz.id : _generateId();

    final now = DateTime.now();
    final publishQuiz = quiz.copyWith(
      id: id,
      code: code,
      status: QuizStatus.live,
      createdAt: now,
      updatedAt: now,
    );

    return _quizRepository.createQuiz(publishQuiz, questions);
  }

  Future<String> _generateUniqueCode() async {
    for (var i = 0; i < 5; i++) {
      final code = CodeGenerator.generate();
      final exists = await _quizRepository.codeExists(code);
      if (!exists) return code;
    }
    throw const QuizCodeCollisionException();
  }

  String _generateId() {
    return Random.secure().nextInt(0x7FFFFFFF).toRadixString(16).padLeft(10, '0');
  }
}
