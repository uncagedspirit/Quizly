import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'hive_providers.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeMode build() {
    final box = ref.watch(appStateBoxProvider);
    final mode = box.get('theme_mode', defaultValue: 'system') as String;
    return _toThemeMode(mode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    final box = ref.read(appStateBoxProvider);
    await box.put('theme_mode', mode.name);
  }

  ThemeMode _toThemeMode(String mode) {
    return switch (mode) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }
}
