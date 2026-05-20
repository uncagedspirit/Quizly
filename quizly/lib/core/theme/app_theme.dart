import 'package:flutter/material.dart';

import 'qz_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final colorScheme = ColorScheme.light(
      primary: const Color(0xFF506834),
      secondary: const Color(0xFFD77204),
      surface: const Color(0xFFFFFFFF),
      error: const Color(0xFFD77204),
      onPrimary: const Color(0xFFF5F1E2),
      onSecondary: Colors.white,
      onSurface: const Color(0xFF1A2410),
      onError: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFFEEE9D6),
      fontFamily: 'Geist',
      extensions: [QzTheme.light()],
    );
  }

  static ThemeData dark() {
    final colorScheme = ColorScheme.dark(
      primary: const Color(0xFFB9CD38),
      secondary: const Color(0xFFE2864B),
      surface: const Color(0xFF212A15),
      error: const Color(0xFFE2864B),
      onPrimary: const Color(0xFF141A0C),
      onSecondary: Colors.white,
      onSurface: const Color(0xFFEEE9D6),
      onError: Colors.white,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFF141A0C),
      fontFamily: 'Geist',
      extensions: [QzTheme.dark()],
    );
  }
}
