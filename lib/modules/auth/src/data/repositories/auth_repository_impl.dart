import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/services/errors/network_error.dart';
import 'package:clean_nest/core/services/errors/storage_error.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/models/user_model.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';
import 'package:clean_nest/modules/auth/src/data/datasources/auth_remote_datasource.dart';
import 'package:clean_nest/modules/auth/src/data/datasources/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource localDatasource;
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl({
    required this.localDatasource,
    required this.remoteDatasource,
  });

  // createUser method
  @override
  Future<Either<Failure, void>> createUser(User user) async {
    try {
      final userModel = UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        password: user.password,
        mascot: Mascot(
          id: 1,
          name: 'Mascot 1',
          imageUrl: 'assets/images/logo_elizeu.png',
        ),
        groups: user.groups,
      );

      await localDatasource.saveUser(userModel.toMap());

      return const Right(null); // Sucesso
    } catch (e) {
      return Left(StorageError(message: "Erro ao salvar o usuário localmente"));
    }
  }

  // updateUser method
  @override
  Future<Either<Failure, void>> updateUser(User user) async {
    try {
      final userModel = UserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        password: user.password,
        mascot: user.mascot,
        groups: user.groups,
      );
      final userMap = userModel.toMap();
      await localDatasource.saveUser(userMap);
      return const Right(null); // Sucesso
    } catch (e) {
      return Left(StorageError(message: "Erro ao atualizar o usuário"));
    }
  }

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
      await localDatasource.clearUser();
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

  // getCurrentUser method
  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final userModelEither = await localDatasource.getCurrentUser();

      return userModelEither.fold(
        (error) {
          return Left(error); // Retorna o erro específico
        },
        (userModel) {
          if (userModel != null) {
            final user = User(
              id: userModel.id,
              name: userModel.name,
              email: userModel.email,
              password: userModel.password,
              mascot: userModel.mascot,
              groups: userModel.groups,
            );
            return Right(user);
          }
          return const Right(null); // Usuário não encontrado
        },
      );
    } catch (e) {
      return Left(StorageError(
          message: "Erro ao obter o usuário local: ${e.toString()}"));
    }
  }
}
