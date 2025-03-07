import 'package:clean_nest/core/user/domain/usecases/save_user.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/entities/user.dart';

abstract class RegisterUserUseCase {
  Future<Either<Failure, User>> call(String email, String password, String name);
}



class RegisterUser {
  final AuthRepository authRepository;
  final SaveUser saveUser;

  RegisterUser(this.authRepository, this.saveUser);

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
    required String name,
  }) async {
    final authResult = await authRepository.register(email, password, name);
    return authResult.fold(
      (failure) => Left(failure),
      (user) async {
        final saveResult = await saveUser(user);
        return saveResult.fold(
          (failure) => left(failure), 
          (_) => right(user), 
        );
      },
    );
  }
}
