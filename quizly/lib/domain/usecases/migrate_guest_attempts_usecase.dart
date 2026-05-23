import 'package:cloud_firestore/cloud_firestore.dart';

class MigrateGuestAttemptsUseCase {
  MigrateGuestAttemptsUseCase(this._firestore);

  final FirebaseFirestore _firestore;

  Future<MigrationResult> execute({
    required String newUid,
    required String deviceId,
  }) async {
    final guestAttempts = await _firestore
        .collection('attempts')
        .where('deviceId', isEqualTo: deviceId)
        .where('attempterId', isEqualTo: null)
        .get();

    if (guestAttempts.docs.isEmpty) {
      return const MigrationResult(migratedCount: 0);
    }

    final batch = _firestore.batch();
    for (final doc in guestAttempts.docs) {
      batch.update(doc.reference, {'attempterId': newUid});
    }
    await batch.commit();

    await _firestore
        .collection('device_tokens')
        .doc(deviceId)
        .update({'linkedUserId': newUid});

    return MigrationResult(migratedCount: guestAttempts.docs.length);
  }
}

class MigrationResult {
  final int migratedCount;
  const MigrationResult({required this.migratedCount});
}
