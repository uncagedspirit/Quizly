import 'package:flutter/material.dart';

import 'qz_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    const colorScheme = ColorScheme.light(
      primary: Color(0xFF506834),
      secondary: Color(0xFFD77204),
      surface: Color(0xFFFFFFFF),
      error: Color(0xFFD77204),
      onPrimary: Color(0xFFF5F1E2),
      onSecondary: Colors.white,
      onSurface: Color(0xFF1A2410),
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
    const colorScheme = ColorScheme.dark(
      primary: Color(0xFFB9CD38),
      secondary: Color(0xFFE2864B),
      surface: Color(0xFF212A15),
      error: Color(0xFFE2864B),
      onPrimary: Color(0xFF141A0C),
      onSecondary: Colors.white,
      onSurface: Color(0xFFEEE9D6),
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
