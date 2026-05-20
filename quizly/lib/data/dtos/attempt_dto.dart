import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/models/attempt.dart';

class AttemptDto {
  AttemptDto._();

  static Attempt fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final scoreMap = data['score'] as Map<String, dynamic>?;

    return Attempt(
      id: doc.id,
      quizId: data['quizId'] as String,
      quizCode: data['quizCode'] as String,
      attempterId: data['attempterId'] as String?,
      attempterName: data['attempterName'] as String,
      deviceId: data['deviceId'] as String,
      isAnonymous: data['isAnonymous'] as bool? ?? false,
      answers: _answersFromList(data['answers'] as List<dynamic>?),
      score: AttemptScore(
        correct: scoreMap?['correct'] as int? ?? 0,
        total: scoreMap?['total'] as int? ?? 0,
        percentage: scoreMap?['percentage'] as int? ?? 0,
        totalTimeMs: scoreMap?['totalTimeMs'] as int? ?? 0,
      ),
      rank: data['rank'] as int?,
      status: AttemptStatus.values.byName(data['status'] as String? ?? 'inProgress'),
      startedAt: (data['startedAt'] as Timestamp).toDate(),
      submittedAt: data['submittedAt'] != null
          ? (data['submittedAt'] as Timestamp).toDate()
          : null,
      challengerAttemptId: data['challengerAttemptId'] as String?,
    );
  }

  static Map<String, dynamic> toFirestore(Attempt attempt) {
    return {
      'quizId': attempt.quizId,
      'quizCode': attempt.quizCode,
      'attempterId': attempt.attempterId,
      'attempterName': attempt.attempterName,
      'deviceId': attempt.deviceId,
      'isAnonymous': attempt.isAnonymous,
      'answers': _answersToList(attempt.answers),
      'score': {
        'correct': attempt.score.correct,
        'total': attempt.score.total,
        'percentage': attempt.score.percentage,
        'totalTimeMs': attempt.score.totalTimeMs,
      },
      'rank': attempt.rank,
      'status': attempt.status.name,
      'startedAt': Timestamp.fromDate(attempt.startedAt),
      'submittedAt': attempt.submittedAt != null
          ? Timestamp.fromDate(attempt.submittedAt!)
          : null,
      'challengerAttemptId': attempt.challengerAttemptId,
    };
  }

  static List<Answer> _answersFromList(List<dynamic>? list) {
    if (list == null) return [];
    return list
        .map((a) => Answer(
              questionId: a['questionId'] as String,
              selectedIndex: a['selectedIndex'] as int?,
              isCorrect: a['isCorrect'] as bool? ?? false,
              timeTakenMs: a['timeTakenMs'] as int? ?? 0,
            ))
        .toList();
  }

  static List<Map<String, dynamic>> _answersToList(List<Answer> answers) {
    return answers
        .map((a) => {
              'questionId': a.questionId,
              'selectedIndex': a.selectedIndex,
              'isCorrect': a.isCorrect,
              'timeTakenMs': a.timeTakenMs,
            })
        .toList();
  }
}
