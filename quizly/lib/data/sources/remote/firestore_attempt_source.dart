import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/models/attempt.dart';
import '../../../domain/models/leaderboard_entry.dart';
import '../../dtos/attempt_dto.dart';

class FirestoreAttemptSource {
  FirestoreAttemptSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference get _attempts => _firestore.collection('attempts');

  Future<String> createAttempt(Attempt attempt) async {
    final doc = _attempts.doc(attempt.id);
    await doc.set(AttemptDto.toFirestore(attempt));
    return attempt.id;
  }

  Future<void> updateAttempt(Attempt attempt) async {
    await _attempts.doc(attempt.id).update(AttemptDto.toFirestore(attempt));
  }

  Future<Attempt?> getAttemptById(String attemptId) async {
    final doc = await _attempts.doc(attemptId).get();
    if (!doc.exists) return null;
    return AttemptDto.fromFirestore(doc);
  }

  Future<List<Attempt>> getAttemptsByQuiz(String quizId) async {
    final snapshot = await _attempts
        .where('quizId', isEqualTo: quizId)
        .where('status', isEqualTo: 'submitted')
        .orderBy('score.percentage', descending: true)
        .orderBy('submittedAt', descending: false)
        .limit(100)
        .get();

    return snapshot.docs.map(AttemptDto.fromFirestore).toList();
  }

  Future<List<Attempt>> getAttemptsByUser(String userId) async {
    final snapshot = await _attempts
        .where('attempterId', isEqualTo: userId)
        .orderBy('submittedAt', descending: true)
        .get();

    return snapshot.docs.map(AttemptDto.fromFirestore).toList();
  }

  Future<List<Attempt>> getAttemptsByDevice(String deviceId) async {
    final snapshot = await _attempts
        .where('deviceId', isEqualTo: deviceId)
        .orderBy('submittedAt', descending: true)
        .get();

    return snapshot.docs.map(AttemptDto.fromFirestore).toList();
  }

  Stream<List<LeaderboardEntry>> getLeaderboardStream(String quizId) {
    return _attempts
        .where('quizId', isEqualTo: quizId)
        .where('status', isEqualTo: 'submitted')
        .orderBy('score.percentage', descending: true)
        .orderBy('score.totalTimeMs', descending: false)
        .orderBy('submittedAt', descending: false)
        .limit(100)
        .snapshots()
        .map((snapshot) {
      final entries = <LeaderboardEntry>[];
      for (int i = 0; i < snapshot.docs.length; i++) {
        final data = snapshot.docs[i].data() as Map<String, dynamic>;
        final score = data['score'] as Map<String, dynamic>;
        entries.add(LeaderboardEntry(
          attemptId: snapshot.docs[i].id,
          attempterName: data['attempterName'] as String? ?? 'Guest',
          score: score['correct'] as int? ?? 0,
          percentage: score['percentage'] as int? ?? 0,
          totalTimeMs: score['totalTimeMs'] as int? ?? 0,
          rank: i + 1,
          submittedAt: data['submittedAt'] != null
              ? (data['submittedAt'] as Timestamp).toDate()
              : DateTime.now(),
        ),);
      }
      return entries;
    });
  }

  Future<int> getRankAbove(String quizId, int percentage) async {
    final snapshot = await _attempts
        .where('quizId', isEqualTo: quizId)
        .where('status', isEqualTo: 'submitted')
        .where('score.percentage', isGreaterThan: percentage)
        .count()
        .get();

    return snapshot.count ?? 0;
  }

  Future<void> markAttemptAbandoned(String attemptId) async {
    await _attempts.doc(attemptId).update({
      'status': 'abandoned',
    });
  }
}
