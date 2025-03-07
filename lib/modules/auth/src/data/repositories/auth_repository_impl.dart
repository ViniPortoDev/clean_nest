import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/services/errors/network_error.dart';
import 'package:clean_nest/core/services/errors/storage_error.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';
import 'package:clean_nest/modules/auth/src/data/datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl({required this.remoteDatasource});

  // login method
  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await remoteDatasource.login(email, password);
      final user = User(
        id: userModel.id,
        name: userModel.name,
        email: userModel.email,
        password: userModel.password,
        mascot: userModel.mascot,
        groups: userModel.groups,
      );
      return Right(user); // Sucesso
    } catch (e) {
      return Left(NetworkError("Erro ao fazer login: ${e.toString()}")); // Erro
    }
  }

  // logout method
  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDatasource.logout();
      return const Right(null); // Sucesso
    } catch (error) {
      if (error is StorageError) {
        return Left(error); // Se for um erro conhecido de armazenamento
      } else if (error is NetworkError) {
        return Left(NetworkError("Falha ao conectar com o servidor"));
      } else {
        return Left(NetworkError("Erro desconhecido ao tentar fazer logout"));
      }
    }
  }

  @override
  Future<Either<Failure, User>> register(
      String email, String password, String name) async {
    try {
      // final token = 'fake_jwt_token';
      const userId = 1234; // Exemplo de ID do usuário.
      final user = User(
          id: userId,
          name: name,
          email: email,
          password: password,
          groups: []); // Exemplo de usuário.

      // await localDataSource.saveToken(token);

      return Right(user);
    } catch (e) {
      return Left(UnexpectedFailure(message: 'Erro ao registrar usuário: $e'));
    }
  }
}
