import 'failure.dart';

sealed class AppException implements Exception {
  final FailureType type;
  final String message;
  final Object? cause;

  const AppException(this.type, this.message, [this.cause]);

  Failure toFailure() => UnknownFailure(this);
}

class NetworkException extends AppException {
  const NetworkException([String? message, Object? cause])
      : super(FailureType.network, message ?? 'No internet connection', cause);

  @override
  Failure toFailure() => NetworkFailure(message);
}

class NotFoundException extends AppException {
  const NotFoundException([String? message, Object? cause])
      : super(FailureType.notFound, message ?? 'Not found', cause);

  @override
  Failure toFailure() => NotFoundFailure(message);
}

class PermissionDeniedException extends AppException {
  const PermissionDeniedException([String? message, Object? cause])
      : super(FailureType.permissionDenied, message ?? 'Permission denied', cause);

  @override
  Failure toFailure() => PermissionDeniedFailure(message);
}

class ValidationException extends AppException {
  const ValidationException(String message) : super(FailureType.validation, message);

  @override
  Failure toFailure() => ValidationFailure(message);
}

class QuizCodeCollisionException extends AppException {
  const QuizCodeCollisionException()
      : super(FailureType.codeCollision, 'Could not generate a unique quiz code');

  @override
  Failure toFailure() => const CodeCollisionFailure();
}
