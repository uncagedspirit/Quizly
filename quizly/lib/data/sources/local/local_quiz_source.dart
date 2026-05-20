import 'dart:convert';

import 'package:hive/hive.dart';

import '../../dtos/quiz_dto.dart';
import '../../../domain/models/quiz.dart';
import '../../../domain/models/question.dart';

class LocalQuizSource {
  LocalQuizSource(this._quizCacheBox);

  final Box _quizCacheBox;

  Future<void> cacheQuiz(Quiz quiz, List<Question> questions) async {
    final data = {
      'quiz': Map<String, dynamic>.from(QuizDto.toFirestore(quiz)..remove('createdAt')..remove('updatedAt')),
      'questions': questions.map(QuizDto.questionToFirestore).toList(),
    };
    await _quizCacheBox.put(quiz.id, jsonEncode(data));
  }

  Quiz? getCachedQuiz(String quizId) {
    final raw = _quizCacheBox.get(quizId) as String?;
    if (raw == null) return null;
    return null; // Simplified: return from cache needs the doc ref; skip for MVP
  }

  Future<void> removeQuiz(String quizId) async {
    await _quizCacheBox.delete(quizId);
  }
}
