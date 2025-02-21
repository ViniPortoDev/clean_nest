import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/entities/user.dart';

class RegisterUser {
  final AuthRepository authRepository;
  final CreateUser createUser;

  RegisterUser(this.authRepository, this.createUser);

  Future<Either<Failure, void>> call(String email, String password, String name) async {
    // 1. Cria credenciais no módulo `auth`
    final authResult = await authRepository.createCredentials(email, password);
    return authResult.fold(
      (failure) => left(failure),
      (userId) async {
        // 2. Cria perfil do usuário no módulo `user`
        final user = User(id: userId, name: name, email: email);
        return await createUser(user);
      },
    );
  }
}