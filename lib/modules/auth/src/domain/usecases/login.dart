import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class LoginUsecase {
  Future<Either<Failure, User>> call(String email, String password);
}

class LoginUser implements LoginUsecase {
  final AuthRepository authRepository;

  LoginUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(String email, String password) async {
    final result = await authRepository.login(email, password);
    return result;
  }
}
