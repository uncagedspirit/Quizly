import 'dart:convert';

import 'package:hive/hive.dart';

import '../../../domain/models/attempt.dart';

class LocalAttemptSource {
  LocalAttemptSource(this._guestAttemptsBox, this._pendingBox);

  final Box _guestAttemptsBox;
  final Box _pendingBox;

  Future<void> saveGuestAttempt(Attempt attempt) async {
    await _guestAttemptsBox.put(attempt.id, jsonEncode(attempt.toJson()));
  }

  List<Attempt> getGuestAttempts(String deviceId) {
    final attempts = <Attempt>[];
    for (final key in _guestAttemptsBox.keys) {
      final raw = _guestAttemptsBox.get(key) as String?;
      if (raw != null) {
        final map = jsonDecode(raw) as Map<String, dynamic>;
        final attempt = Attempt.fromJson(map);
        if (attempt.deviceId == deviceId) {
          attempts.add(attempt);
        }
      }
    }
    return attempts;
  }

  Future<void> removeGuestAttempt(String id) async {
    await _guestAttemptsBox.delete(id);
  }

  Future<void> addPendingSubmission(Attempt attempt) async {
    await _pendingBox.put(attempt.id, jsonEncode(attempt.toJson()));
  }

  List<Attempt> getPendingSubmissions() {
    final pending = <Attempt>[];
    for (final key in _pendingBox.keys) {
      final raw = _pendingBox.get(key) as String?;
      if (raw != null) {
        pending.add(Attempt.fromJson(jsonDecode(raw) as Map<String, dynamic>));
      }
    }
    return pending;
  }

  Future<void> removePendingSubmission(String id) async {
    await _pendingBox.delete(id);
  }

  Future<void> clearGuestAttempts() async {
    await _guestAttemptsBox.clear();
  }
}
