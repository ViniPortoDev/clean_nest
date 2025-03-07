import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/user/domain/usecases/clear_user.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class LogoutUsecase {
  Future<Either<Failure, void>> call();
}

class Logout implements LogoutUsecase {
  final AuthRepository authRepository;
  final ClearUserUseCase clearUser;

  Logout(this.authRepository, this.clearUser);

  @override
  Future<Either<Failure, void>> call() async {
    final result = await authRepository.logout();
    return result.fold(
      (failure) => Left(failure),
      (_) async => await clearUser.call(),
    );
  }
}
