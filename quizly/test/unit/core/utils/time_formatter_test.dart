import 'package:flutter_test/flutter_test.dart';

import 'package:quizly/core/utils/time_formatter.dart';

void main() {
  group('TimeFormatter', () {
    group('formatDuration', () {
      test('formats seconds', () {
        expect(TimeFormatter.formatDuration(const Duration(seconds: 45)), '0m 45s');
      });

      test('formats minutes and seconds', () {
        expect(
          TimeFormatter.formatDuration(const Duration(minutes: 2, seconds: 34)),
          '2m 34s',
        );
      });
    });

    group('formatRelative', () {
      test('handles just now', () {
        final dt = DateTime.now().subtract(const Duration(seconds: 30));
        expect(TimeFormatter.formatRelative(dt), 'just now');
      });

      test('handles minutes ago', () {
        final dt = DateTime.now().subtract(const Duration(minutes: 5));
        expect(TimeFormatter.formatRelative(dt), '5m ago');
      });

      test('handles hours ago', () {
        final dt = DateTime.now().subtract(const Duration(hours: 3));
        expect(TimeFormatter.formatRelative(dt), '3h ago');
      });

      test('handles future time', () {
        final dt = DateTime.now().add(const Duration(hours: 2));
        expect(TimeFormatter.formatRelative(dt), 'in 2h');
      });
    });
  });
}
