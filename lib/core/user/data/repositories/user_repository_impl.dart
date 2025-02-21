import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/user/data/datasource/user_local_datasource.dart';
import 'package:clean_nest/core/user/data/mappers/user_mapper.dart';
import 'package:clean_nest/core/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({required this.userLocalDataSource});

  @override
  Future<Either<Failure, void>> createUser(User user) async {
    try {
      await userLocalDataSource.createUser(user.toModel());
      return right(null);
    } catch (e) {
      return left(UnexpectedFailure(message: "Erro ao criar usuário: $e"));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final result = await userLocalDataSource.getCurrentUser();
      return result.fold(
        (error) => left(error),
        (userModel) => right(userModel?.toEntity()),
      );
    } catch (e) {
      return left(UnexpectedFailure(message: "Erro ao buscar usuário: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> saveUser(User user) async {
    try {
      return await userLocalDataSource.saveUser(user.toModel());
    } catch (e) {
      return left(UnexpectedFailure(message: "Erro ao salvar usuário: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(User user) async {
    try {
      return await userLocalDataSource.updateUser(user.toModel());
    } catch (e) {
      return left(UnexpectedFailure(message: "Erro ao atualizar usuário: $e"));
    }
  }

  @override
  Future<Either<Failure, void>> clearUser() async {
    return await userLocalDataSource.clearUser();
  }
}
