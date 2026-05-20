import 'package:hive/hive.dart';

class LocalUserSource {
  LocalUserSource(this._appStateBox);

  final Box _appStateBox;

  String? get deviceId => _appStateBox.get('device_id') as String?;
  String get themeMode => _appStateBox.get('theme_mode', defaultValue: 'system') as String;
  bool get hasSeenOnboarding => _appStateBox.get('has_seen_onboarding', defaultValue: false) as bool;

  Future<void> setThemeMode(String mode) => _appStateBox.put('theme_mode', mode);
  Future<void> setHasSeenOnboarding(bool value) => _appStateBox.put('has_seen_onboarding', value);
}
