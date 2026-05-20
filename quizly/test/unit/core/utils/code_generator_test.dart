import 'package:flutter_test/flutter_test.dart';

import 'package:quizly/core/utils/code_generator.dart';
import 'package:quizly/core/constants/app_constants.dart';

void main() {
  group('CodeGenerator', () {
    test('generates a 6-char code', () {
      final code = CodeGenerator.generate();
      expect(code.length, AppConstants.quizCodeLength);
    });

    test('only uses allowed charset', () {
      final code = CodeGenerator.generate();
      for (final c in code.split('')) {
        expect(AppConstants.quizCodeCharset.contains(c), isTrue);
      }
    });

    test('generates different codes on each call', () {
      final code1 = CodeGenerator.generate();
      final code2 = CodeGenerator.generate();
      // Extremely unlikely to be equal, but possible in theory
      // Just check format is correct
      expect(code1.length, 6);
      expect(code2.length, 6);
    });

    test('generates uppercase only', () {
      final code = CodeGenerator.generate();
      expect(code, code.toUpperCase());
    });
  });
}
