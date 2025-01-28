import 'package:clean_nest/core/domain/entities/user.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';

abstract class LoginUsecase {
  Future<User> call(String email, String password);
}

class LoginUser implements LoginUsecase {
  final AuthRepository authRepository;

  LoginUser(this.authRepository);

  @override
  Future<User> call(String email, String password) async {
    final user = await authRepository.login(email, password);
    return user;
  }
}
