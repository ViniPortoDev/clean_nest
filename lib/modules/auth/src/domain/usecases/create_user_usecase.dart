import 'package:clean_nest/core/domain/entities/user.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';

abstract class CreateUserUsecase {
  Future<User> execute();
}

class CreateUser implements CreateUserUsecase {
 final AuthRepository _authRepository;
 CreateUser(this._authRepository);

  @override
  Future<User> execute() async {
   final user = _authRepository.createUser();
    return user;
  }
}
