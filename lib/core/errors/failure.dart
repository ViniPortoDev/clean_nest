///Interface of project's base error
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class UnknownError extends Failure {
  const UnknownError({required String message}) : super( message);
}

class UnauthorizedError extends Failure {
  const UnauthorizedError({required String message}) : super(message);
}

class NotFoundError extends Failure {
  const NotFoundError({required String message}) : super(message);
}

class BadRequestError extends Failure {
  const BadRequestError({required String message}) : super(message);
}
