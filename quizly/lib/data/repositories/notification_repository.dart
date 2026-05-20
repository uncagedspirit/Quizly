import '../../sources/remote/fcm_source.dart';

class NotificationRepository {
  NotificationRepository(this._fcmSource);

  final FcmSource _fcmSource;

  Future<String?> getToken() => _fcmSource.getToken();
  Stream<String> get onTokenRefresh => _fcmSource.onTokenRefresh;
  Stream<dynamic> get onForegroundMessage => _fcmSource.onForegroundMessage;
  Stream<dynamic> get onMessageOpenedApp => _fcmSource.onMessageOpenedApp;
  Future<dynamic> getInitialMessage() => _fcmSource.getInitialMessage();
  Future<dynamic> requestPermission() => _fcmSource.requestPermission();
}
