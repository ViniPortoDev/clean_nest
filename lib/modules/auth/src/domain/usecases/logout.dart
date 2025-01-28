
import '../repositories/auth_repository.dart';

abstract class LogoutUsecase {
  Future<void> call();
}

class Logout implements LogoutUsecase {
  final AuthRepository authRepository;

  Logout(this.authRepository);

  @override
  Future<void> call() async {
    await authRepository.logout();
  }
}
