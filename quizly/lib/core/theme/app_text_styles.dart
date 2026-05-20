import 'package:flutter/material.dart';

class QzTextStyles {
  const QzTextStyles();

  static const _fontFamily = 'Geist';
  static const _monoFamily = 'JetBrainsMono';

  TextStyle get displayXxl => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 86,
        height: 0.92,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.034 * 86,
      );

  TextStyle get displayXl => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 56,
        height: 0.92,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.028 * 56,
      );

  TextStyle get displayLg => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 44,
        height: 1.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.023 * 44,
      );

  TextStyle get displayMd => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 36,
        height: 1.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.028 * 36,
      );

  TextStyle get displaySm => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32,
        height: 1.05,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.019 * 32,
      );

  TextStyle get headingLg => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22,
        height: 1.15,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.018 * 22,
      );

  TextStyle get headingMd => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        height: 1.2,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.01 * 18,
      );

  TextStyle get headingSm => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        height: 1.25,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.013 * 16,
      );

  TextStyle get bodyLg => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 15,
        height: 1.4,
        fontWeight: FontWeight.w500,
      );

  TextStyle get bodyMd => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        height: 1.4,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.014 * 14,
      );

  TextStyle get bodySm => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 13,
        height: 1.45,
        fontWeight: FontWeight.w500,
      );

  TextStyle get bodyXs => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        height: 1.45,
        fontWeight: FontWeight.w500,
      );

  TextStyle get labelMd => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 13,
        height: 1.3,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.015 * 13,
      );

  TextStyle get labelSm => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        height: 1.3,
        fontWeight: FontWeight.w600,
      );

  TextStyle get overline => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 11,
        height: 1.3,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.06 * 11,
      );

  TextStyle get monoLg => const TextStyle(
        fontFamily: _monoFamily,
        fontSize: 32,
        height: 1.0,
        fontWeight: FontWeight.w600,
      );

  TextStyle get monoMd => const TextStyle(
        fontFamily: _monoFamily,
        fontSize: 24,
        height: 1.0,
        fontWeight: FontWeight.w600,
      );

  TextStyle get monoSm => const TextStyle(
        fontFamily: _monoFamily,
        fontSize: 13,
        height: 1.0,
        fontWeight: FontWeight.w600,
      );

  TextStyle get monoXs => const TextStyle(
        fontFamily: _monoFamily,
        fontSize: 11,
        height: 1.0,
        fontWeight: FontWeight.w500,
      );
}
