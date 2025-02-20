import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UpdateUserUsecase {
  Future<Either<Failure, void>> call(User user);
}

class UpdateUser implements UpdateUserUsecase {
  final AuthRepository authRepository;

  UpdateUser(this.authRepository);

  @override
  Future<Either<Failure, void>> call(User user) async {
    final result = await authRepository.updateUser(user);
    return result;
  }
}
