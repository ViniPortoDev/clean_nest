import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UpdateUserUseCase {
  Future<Either<Failure, void>> call(User user);
}

class UpdateUser implements UpdateUserUseCase {
  final UserRepository repository;

  UpdateUser(this.repository);

  @override
  Future<Either<Failure, void>> call(User user) async {
    return await repository.updateUser(user);
  }
}
