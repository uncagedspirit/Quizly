import '../../../domain/models/app_user.dart';
import '../../sources/remote/firestore_user_source.dart';

class UserRepository {
  UserRepository(this._remoteSource);

  final FirestoreUserSource _remoteSource;

  Future<AppUser?> getUserById(String uid) async {
    return _remoteSource.getUserById(uid);
  }

  Future<void> updatePreferences(String uid, AppUserPreferences prefs) async {
    await _remoteSource.updatePreferences(uid, prefs);
  }

  Future<void> updateLastSeen(String uid) async {
    await _remoteSource.updateLastSeen(uid);
  }
}
