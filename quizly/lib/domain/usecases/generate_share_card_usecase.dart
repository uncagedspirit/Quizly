import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../../domain/models/attempt.dart';

class GenerateShareCardUseCase {
  GenerateShareCardUseCase(this._screenshotController);

  final ScreenshotController _screenshotController;

  Future<ui.Image?> capture(Attempt attempt, String quizTitle) async {
    return _screenshotController.capture(
      delay: const Duration(milliseconds: 100),
      pixelRatio: 3.0,
    );
  }
}
