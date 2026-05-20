import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/models/quiz.dart';
import '../../../domain/models/question.dart';

class QuizDto {
  QuizDto._();

  static Quiz fromFirestore(
    DocumentSnapshot doc,
    List<Question> questions,
  ) {
    final data = doc.data() as Map<String, dynamic>;
    return Quiz(
      id: doc.id,
      code: data['code'] as String,
      creatorId: data['creatorId'] as String,
      creatorName: data['creatorName'] as String,
      title: data['title'] as String,
      description: data['description'] as String?,
      categoryEmoji: data['categoryEmoji'] as String?,
      category: data['category'] as String?,
      questionCount: data['questionCount'] as int? ?? questions.length,
      settings: _settingsFromMap(data['settings'] as Map<String, dynamic>?),
      stats: _statsFromMap(data['stats'] as Map<String, dynamic>?),
      status: QuizStatus.values.byName(data['status'] as String? ?? 'draft'),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  static Map<String, dynamic> toFirestore(Quiz quiz) {
    return {
      'code': quiz.code,
      'creatorId': quiz.creatorId,
      'creatorName': quiz.creatorName,
      'title': quiz.title,
      'description': quiz.description,
      'categoryEmoji': quiz.categoryEmoji,
      'category': quiz.category,
      'questionCount': quiz.questionCount,
      'settings': _settingsToMap(quiz.settings),
      'stats': _statsToMap(quiz.stats),
      'status': quiz.status.name,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  static Map<String, dynamic> questionToFirestore(Question q) {
    return {
      'id': q.id,
      'index': q.index,
      'type': q.type.name,
      'text': q.text,
      'options': q.options,
      'correctIndex': q.correctIndex,
      'explanation': q.explanation,
    };
  }

  static Question questionFromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Question(
      id: doc.id,
      index: data['index'] as int,
      type: QuestionType.values.byName(data['type'] as String),
      text: data['text'] as String,
      options: List<String>.from(data['options'] as List),
      correctIndex: data['correctIndex'] as int,
      explanation: data['explanation'] as String?,
    );
  }

  static QuizSettings _settingsFromMap(Map<String, dynamic>? map) {
    if (map == null) return const QuizSettings();
    return QuizSettings(
      allowAnonymous: map['allowAnonymous'] as bool? ?? false,
      perQuestionTimerSec: map['perQuestionTimerSec'] as int?,
      deadlineAt: map['deadlineAt'] != null
          ? (map['deadlineAt'] as Timestamp).toDate()
          : null,
      revealMode: RevealMode.values.byName(
        map['revealMode'] as String? ?? 'atEnd',
      ),
    );
  }

  static Map<String, dynamic> _settingsToMap(QuizSettings s) {
    return {
      'allowAnonymous': s.allowAnonymous,
      'perQuestionTimerSec': s.perQuestionTimerSec,
      'deadlineAt': s.deadlineAt != null
          ? Timestamp.fromDate(s.deadlineAt!)
          : null,
      'revealMode': s.revealMode.name,
    };
  }

  static QuizStats _statsFromMap(Map<String, dynamic>? map) {
    if (map == null) return const QuizStats();
    return QuizStats(
      attemptCount: map['attemptCount'] as int? ?? 0,
      averageScore: (map['averageScore'] as num?)?.toDouble() ?? 0.0,
      hardestQuestionIndex: map['hardestQuestionIndex'] as int?,
    );
  }

  static Map<String, dynamic> _statsToMap(QuizStats s) {
    return {
      'attemptCount': s.attemptCount,
      'averageScore': s.averageScore,
      'hardestQuestionIndex': s.hardestQuestionIndex,
    };
  }
}
