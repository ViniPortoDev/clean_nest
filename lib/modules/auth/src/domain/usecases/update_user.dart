import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';

abstract class UpdateUserUsecase {
  Future<void> call(User user);
}

class UpdateUser implements UpdateUserUsecase {
  final AuthRepository authRepository;

  UpdateUser(this.authRepository);
  @override
  Future<void> call(User user) async {
    authRepository.updateUser(user);
  }
}
