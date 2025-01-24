import 'package:clean_nest/core/domain/entities/user.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';

abstract class LoginUser {
  Future<void> execute(User user);
}

class LoginUserImpl implements LoginUser {
  final AuthRepository repository;

  LoginUserImpl(this.repository);

  @override
  Future<void> execute(User user) async {
    await repository.loginUser(user);
  }
}
