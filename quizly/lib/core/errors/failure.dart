enum FailureType {
  network,
  notFound,
  permissionDenied,
  validation,
  unknown,
  codeCollision,
  quizClosed,
  challengeExpired,
}

sealed class Failure {
  final FailureType type;
  final String message;
  final Object? cause;

  const Failure(this.type, this.message, [this.cause]);
}

class NetworkFailure extends Failure {
  const NetworkFailure([String? message])
      : super(FailureType.network, message ?? 'No internet connection');
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([String? message])
      : super(FailureType.notFound, message ?? 'Not found');
}

class PermissionDeniedFailure extends Failure {
  const PermissionDeniedFailure([String? message])
      : super(FailureType.permissionDenied, message ?? 'Permission denied');
}

class ValidationFailure extends Failure {
  const ValidationFailure(String message) : super(FailureType.validation, message);
}

class UnknownFailure extends Failure {
  const UnknownFailure([Object? cause])
      : super(FailureType.unknown, 'Something went wrong', cause);
}

class CodeCollisionFailure extends Failure {
  const CodeCollisionFailure()
      : super(FailureType.codeCollision, 'Could not generate a unique code');
}

class QuizClosedFailure extends Failure {
  const QuizClosedFailure() : super(FailureType.quizClosed, 'This quiz is closed');
}

class ChallengeExpiredFailure extends Failure {
  const ChallengeExpiredFailure()
      : super(FailureType.challengeExpired, 'This challenge has expired');
}
