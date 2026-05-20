import 'dart:typed_data';

import 'package:screenshot/screenshot.dart';

import '../../../domain/models/attempt.dart';

class GenerateShareCardUseCase {
  GenerateShareCardUseCase(this._screenshotController);

  final ScreenshotController _screenshotController;

  Future<Uint8List?> capture(Attempt attempt, String quizTitle) async {
    return _screenshotController.capture(
      delay: const Duration(milliseconds: 100),
      pixelRatio: 3.0,
    );
  }
}
