import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class GetCurrentUserUseCase {
  Future<Either<Failure, User?>> call();
}

@Injectable(as: GetCurrentUserUseCase)
class GetCurrentUser implements GetCurrentUserUseCase {
  final UserRepository repository;

  GetCurrentUser(this.repository);

  @override
  Future<Either<Failure, User?>> call() async {
    return await repository.getCurrentUser();
  }
}
