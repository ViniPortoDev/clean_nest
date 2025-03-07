import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/user/domain/usecases/save_user.dart';

abstract class LoginUseCase {
  Future<Either<Failure, User>> call(String email, String password);
}

class Login implements LoginUseCase {
  final AuthRepository authRepository;
  final SaveUserUseCase saveUser;

  Login(this.authRepository, this.saveUser);

  @override
  Future<Either<Failure, User>> call(String email, String password) async {
    final authResult = await authRepository.login(email, password);
    return authResult.fold(
      (failure) => Left(failure),
      (user) async {
        final saveResult = await saveUser(user);
        return saveResult.fold(
          (failure) => Left(failure),
          (_) => Right(user),
        );
      },
    );
  }
}
