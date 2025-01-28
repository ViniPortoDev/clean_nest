import 'package:clean_nest/core/domain/entities/user.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';

abstract class CreateUserUsecase {
  Future<void> call(String name, String email, String password);
}

class CreateUser implements CreateUserUsecase {
 final AuthRepository _authRepository;
 CreateUser(this._authRepository);

 @override
  Future<void> call(String name, String email, String password) async {
    final user = User(
      id: 1,
      name: name,
      email: email,
      password: password,
      groups: [],
    );
    await _authRepository.createUser(user);
  }
}
