import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/errors/failure.dart';
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
    final result = await authRepository.getCurrentUser();
    return result;
  }
}
