import 'package:flutter_test/flutter_test.dart';

import 'package:quizly/core/utils/validators.dart';

void main() {
  group('Validators', () {
    group('displayName', () {
      test('accepts valid name', () {
        expect(Validators.displayName('John'), isNull);
        expect(Validators.displayName("O'Brien"), isNull);
      });

      test('rejects empty', () {
        expect(Validators.displayName(''), isNotNull);
        expect(Validators.displayName(null), isNotNull);
      });

      test('rejects too short', () {
        expect(Validators.displayName('A'), isNotNull);
      });

      test('rejects too long', () {
        expect(Validators.displayName('A' * 31), isNotNull);
      });

      test('rejects special chars', () {
        expect(Validators.displayName('John@Doe'), isNotNull);
      });
    });

    group('email', () {
      test('accepts valid email', () {
        expect(Validators.email('test@example.com'), isNull);
      });

      test('rejects empty', () {
        expect(Validators.email(''), isNotNull);
      });

      test('rejects invalid format', () {
        expect(Validators.email('notanemail'), isNotNull);
        expect(Validators.email('@missing.com'), isNotNull);
        expect(Validators.email('missing@'), isNotNull);
      });
    });

    group('password', () {
      test('accepts valid password', () {
        expect(Validators.password('12345678'), isNull);
      });

      test('rejects short password', () {
        expect(Validators.password('short'), isNotNull);
      });

      test('rejects empty', () {
        expect(Validators.password(''), isNotNull);
        expect(Validators.password(null), isNotNull);
      });
    });

    group('quizTitle', () {
      test('accepts valid title', () {
        expect(Validators.quizTitle('My Quiz'), isNull);
      });

      test('rejects empty', () {
        expect(Validators.quizTitle(''), isNotNull);
      });

      test('rejects too long', () {
        expect(Validators.quizTitle('A' * 81), isNotNull);
      });
    });

    group('questionText', () {
      test('accepts valid text', () {
        expect(Validators.questionText('What is Flutter?'), isNull);
      });

      test('rejects empty', () {
        expect(Validators.questionText(''), isNotNull);
      });

      test('rejects too long', () {
        expect(Validators.questionText('A' * 301), isNotNull);
      });
    });
  });
}
