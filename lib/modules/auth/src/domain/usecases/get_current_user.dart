import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';

abstract class GetCurrentUserUsecase {
  Future<User?> call();
}

class GetCurrentUser implements GetCurrentUserUsecase {
  final AuthRepository authRepository;

  GetCurrentUser(this.authRepository);

  @override
  Future<User?> call() async {
    final user = await authRepository.getCurrentUser();
    return user;
  }
}
