import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/services/errors/storage_error.dart';
import 'package:clean_nest/core/services/errors/network_error.dart';
import 'package:clean_nest/modules/auth/src/domain/errors/auth_errors.dart';

class ErrorHandlingService {
  static String handleError(Failure error) {
    if (error is StorageError) {
      return "Erro ao acessar os dados locais.";
    } else if (error is NetworkError) {
      return "Erro de conexão com a internet.";
    } else if (error is AuthError) {
      return "Erro de autenticação. Tente novamente.";
    }
    return "Erro desconhecido. Tente novamente mais tarde.";
  }
}
