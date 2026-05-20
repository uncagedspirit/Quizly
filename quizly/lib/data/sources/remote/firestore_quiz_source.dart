import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/models/quiz.dart';
import '../../../domain/models/question.dart';
import '../../dtos/quiz_dto.dart';

class FirestoreQuizSource {
  FirestoreQuizSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference get _quizzes => _firestore.collection('quizzes');

  CollectionReference _questionsRef(String quizId) =>
      _quizzes.doc(quizId).collection('questions');

  Future<String> createQuiz(Quiz quiz, List<Question> questions) async {
    final batch = _firestore.batch();
    final quizRef = _quizzes.doc(quiz.id);
    batch.set(quizRef, QuizDto.toFirestore(quiz));

    for (int i = 0; i < questions.length; i++) {
      final q = questions[i];
      final qRef = _questionsRef(quiz.id).doc('q_${i.toString().padLeft(2, '0')}');
      batch.set(qRef, QuizDto.questionToFirestore(q));
    }

    await batch.commit();
    return quiz.id;
  }

  Future<void> updateQuiz(Quiz quiz) async {
    await _quizzes.doc(quiz.id).update(QuizDto.toFirestore(quiz));
  }

  Future<void> deleteQuiz(String quizId) async {
    await _quizzes.doc(quizId).update({'status': 'deleted'});
  }

  Future<Quiz?> getQuizById(String quizId) async {
    final doc = await _quizzes.doc(quizId).get();
    if (!doc.exists) return null;
    final questions = await getQuestions(quizId);
    return QuizDto.fromFirestore(doc, questions);
  }

  Future<Quiz?> getQuizByCode(String code) async {
    final snapshot = await _quizzes
        .where('code', isEqualTo: code)
        .where('status', isEqualTo: 'live')
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return null;
    final doc = snapshot.docs.first;
    final questions = await getQuestions(doc.id);
    return QuizDto.fromFirestore(doc, questions);
  }

  Future<List<Quiz>> getCreatorQuizzes(String creatorId) async {
    final snapshot = await _quizzes
        .where('creatorId', isEqualTo: creatorId)
        .orderBy('createdAt', descending: true)
        .get();

    final quizzes = <Quiz>[];
    for (final doc in snapshot.docs) {
      final questions = await getQuestions(doc.id);
      quizzes.add(QuizDto.fromFirestore(doc, questions));
    }
    return quizzes;
  }

  Future<List<Question>> getQuestions(String quizId) async {
    final snapshot = await _questionsRef(quizId).orderBy('index').get();
    return snapshot.docs.map(QuizDto.questionFromFirestore).toList();
  }

  Future<bool> codeExists(String code) async {
    final snapshot = await _quizzes
        .where('code', isEqualTo: code)
        .limit(1)
        .get();
    return snapshot.docs.isNotEmpty;
  }

  Future<void> updateQuizStats(String quizId, QuizStats stats) async {
    await _quizzes.doc(quizId).update({
      'stats': {
        'attemptCount': stats.attemptCount,
        'averageScore': stats.averageScore,
        'hardestQuestionIndex': stats.hardestQuestionIndex,
      },
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}
