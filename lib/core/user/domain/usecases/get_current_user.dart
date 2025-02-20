import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetCurrentUserUseCase {
  Future<Either<Failure, User?>> call();
}

class GetCurrentUser implements GetCurrentUserUseCase {
  final UserRepository repository;

  GetCurrentUser(this.repository);

  @override
  Future<Either<Failure, User?>> call() async {
    return await repository.getCurrentUser();
  }
}
