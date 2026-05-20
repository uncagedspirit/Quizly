import 'dart:math';

import '../constants/app_constants.dart';

class CodeGenerator {
  CodeGenerator._();

  static String generate() {
    const charset = AppConstants.quizCodeCharset;
    final random = Random.secure();
    return List.generate(
      AppConstants.quizCodeLength,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }
}
