import 'package:clean_nest/core/errors/failure.dart';

class FailedCreateUserError extends Failure {
  FailedCreateUserError({required String message}) : super(message);
}

class FailedGetUserError extends Failure {
  FailedGetUserError({required String message}) : super(message);
}

class FailedLoginError extends Failure {
  FailedLoginError({required String message}) : super(message);
}

class FailedLogoutError extends Failure {
  FailedLogoutError({required String message}) : super(message);
}

class FailedUpdateUserError extends Failure {
  FailedUpdateUserError({required String message}) : super(message);
}
