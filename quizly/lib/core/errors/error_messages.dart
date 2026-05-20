import 'failure.dart';

class ErrorMessages {
  ErrorMessages._();

  static String fromFailure(Failure failure) {
    return switch (failure.type) {
      FailureType.network => 'No internet connection. Check your network.',
      FailureType.notFound => 'Quiz not found. Double-check the code.',
      FailureType.permissionDenied => 'You don\'t have permission for this.',
      FailureType.validation => failure.message,
      FailureType.unknown => 'Something went wrong. Please try again.',
      FailureType.codeCollision =>
        'Could not generate a unique code. Please try again.',
      FailureType.quizClosed => 'This quiz has been closed by the creator.',
      FailureType.challengeExpired => 'This challenge has expired.',
    };
  }
}
