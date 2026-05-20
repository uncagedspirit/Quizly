import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_colors.dart';

class QzTextStyles {
  QzTextStyles._();

  static const _fontFamily = 'Geist';
  static const _monoFamily = 'JetBrainsMono';

  // Display
  static TextStyle get displayXxl => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 86,
        height: 0.92,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.034 * 86,
      );

  static TextStyle get displayXl => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 56,
        height: 0.92,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.028 * 56,
      );

  static TextStyle get displayLg => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 44,
        height: 1.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.023 * 44,
      );

  static TextStyle get displayMd => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 36,
        height: 1.0,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.028 * 36,
      );

  static TextStyle get displaySm => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32,
        height: 1.05,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.019 * 32,
      );

  // Headings
  static TextStyle get headingLg => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22,
        height: 1.15,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.018 * 22,
      );

  static TextStyle get headingMd => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        height: 1.2,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.01 * 18,
      );

  static TextStyle get headingSm => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        height: 1.25,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.013 * 16,
      );

  // Body
  static TextStyle get bodyLg => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 15,
        height: 1.4,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get bodyMd => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        height: 1.4,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.014 * 14,
      );

  static TextStyle get bodySm => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 13,
        height: 1.45,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get bodyXs => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        height: 1.45,
        fontWeight: FontWeight.w500,
      );

  // Labels
  static TextStyle get labelMd => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 13,
        height: 1.3,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.015 * 13,
      );

  static TextStyle get labelSm => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        height: 1.3,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get overline => const TextStyle(
        fontFamily: _fontFamily,
        fontSize: 11,
        height: 1.3,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.06 * 11,
      );

  // Mono
  static TextStyle get monoLg => const TextStyle(
        fontFamily: _monoFamily,
        fontSize: 32,
        height: 1.0,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get monoMd => const TextStyle(
        fontFamily: _monoFamily,
        fontSize: 24,
        height: 1.0,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get monoSm => const TextStyle(
        fontFamily: _monoFamily,
        fontSize: 13,
        height: 1.0,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get monoXs => const TextStyle(
        fontFamily: _monoFamily,
        fontSize: 11,
        height: 1.0,
        fontWeight: FontWeight.w500,
      );
}
