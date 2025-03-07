import 'package:clean_nest/core/errors/failure.dart';

class AuthError extends Failure {
  AuthError({required String message}) : super(message);
}

class AuthTokenError extends AuthError {
  AuthTokenError() : super(message: "Erro com o token de autenticação.");
}

class AuthLoginError extends AuthError {
  AuthLoginError() : super(message: "Erro ao realizar login.");
}

class UserNotFound extends AuthError {
  UserNotFound() : super(message: "Usuario não encontrado.");
}