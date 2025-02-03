///Interface of project's base error
abstract class Failure {
  final String message;
  const Failure(this.message);
}

class UnknownError extends Failure {
  const UnknownError({required String meessage}) : super(meessage);
}

class UnauthorizedError extends Failure {
  const UnauthorizedError({required String meessage}) : super(meessage);
}

class NotFoundError extends Failure {
  const NotFoundError({required String meessage}) : super(meessage);
}

class BadRequestError extends Failure {
  const BadRequestError({required String meessage}) : super(meessage);
}
