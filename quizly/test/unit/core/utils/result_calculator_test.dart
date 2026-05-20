import 'package:flutter_test/flutter_test.dart';

import 'package:quizly/core/utils/result_calculator.dart';

void main() {
  group('ResultCalculator', () {
    group('correctCount', () {
      test('counts correct answers', () {
        expect(ResultCalculator.correctCount([true, true, false, true]), 3);
      });

      test('returns 0 for all wrong', () {
        expect(ResultCalculator.correctCount([false, false, false]), 0);
      });

      test('returns 0 for empty list', () {
        expect(ResultCalculator.correctCount([]), 0);
      });
    });

    group('percentage', () {
      test('calculates 100%', () {
        expect(ResultCalculator.percentage(10, 10), 100);
      });

      test('calculates 50%', () {
        expect(ResultCalculator.percentage(5, 10), 50);
      });

      test('returns 0 for zero total', () {
        expect(ResultCalculator.percentage(0, 0), 0);
      });

      test('rounds correctly', () {
        expect(ResultCalculator.percentage(1, 3), 33);
      });
    });

    group('totalTimeMs', () {
      test('sums time values', () {
        expect(ResultCalculator.totalTimeMs([1000, 2000, 1500]), 4500);
      });

      test('returns 0 for empty list', () {
        expect(ResultCalculator.totalTimeMs([]), 0);
      });
    });

    group('rank', () {
      test('rank is above count + 1', () {
        expect(ResultCalculator.rank(0), 1);
        expect(ResultCalculator.rank(5), 6);
      });
    });
  });
}
