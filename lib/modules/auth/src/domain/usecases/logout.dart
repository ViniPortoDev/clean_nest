import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class LogoutUsecase {
  Future<Either<Failure, void>> call();
}

class Logout implements LogoutUsecase {
  final AuthRepository authRepository;

  Logout(this.authRepository);

  @override
  Future<Either<Failure, void>> call() async {
    final result = await authRepository.logout();
    return result;
  }
}
