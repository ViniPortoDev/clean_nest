import 'package:clean_nest/core/errors/failure.dart';

class NetworkError extends Failure {
  NetworkError(String message) : super('Erro ao se conectar com a internet: $message');
}