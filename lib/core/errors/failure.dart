///Interface of project's base error
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class InvalidInputFailure extends Failure {
  const InvalidInputFailure({required String message}) : super(message);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required String message}) : super(message);
}

class UnauthorizedError extends Failure {
  const UnauthorizedError({required String message}) : super(message);
}
