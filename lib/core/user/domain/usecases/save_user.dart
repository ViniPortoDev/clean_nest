import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SaveUserUseCase {
  Future<Either<Failure, void>> call(User user);
}

class SaveUser implements SaveUserUseCase {
  final UserRepository repository;

  SaveUser(this.repository);

  @override
  Future<Either<Failure, void>> call(User user) async {
    return await repository.saveUser(user);
  }
}
