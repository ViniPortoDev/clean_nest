import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/services/errors/network_error.dart';
import 'package:clean_nest/core/services/errors/storage_error.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetCurrentUserUsecase {
  Future<Either<Failure, User?>> call();
}

class GetCurrentUser implements GetCurrentUserUsecase {
  final AuthRepository authRepository;

  GetCurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User?>> call() async {
    try {
      final result = await authRepository.getCurrentUser();

      return result.fold(
        (failure) {
          // Se for um erro de Storage, use StorageError.
          if (failure is StorageError) {
            return Left(StorageError(
                message: "Erro ao tentar obter o usuário do storage."));
          }
          // Se for um erro de rede, use NetworkError.
          else if (failure is NetworkError) {
            return Left(NetworkError("Falha ao tentar conectar ao servidor."));
          }
          // Se for outro tipo de falha, apenas retorne a falha original.
          else {
            return Left(failure);
          }
        },
        (user) {
          return Right(user);
        },
      );
    } catch (e) {
      // Aqui você pode adicionar um erro genérico de falha inesperada.
      print('Erro inesperado: $e');
      return Left(
          StorageError(message: 'Erro inesperado ao tentar obter o usuário.'));
    }
  }
}
