import 'package:clean_nest/core/user/domain/usecases/save_user.dart';
import 'package:clean_nest/features/auth/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:injectable/injectable.dart';

abstract class RegisterUserUseCase {
  Future<Either<Failure, User>> call(
      String email, String password, String name);
}

@Injectable(as: RegisterUserUseCase)
class RegisterUser implements RegisterUserUseCase {
  final AuthRepository authRepository;
  final SaveUser saveUser;

  RegisterUser(this.authRepository, this.saveUser);

  @override
  Future<Either<Failure, User>> call(
    String email,
    String password,
    String name,
  ) async {
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
