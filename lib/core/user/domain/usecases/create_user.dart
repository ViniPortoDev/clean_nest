import 'package:clean_nest/core/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/entities/user.dart';

abstract class CreateUserUseCase {
  Future<Either<Failure, void>> call(User user);
}

class CreateUser implements CreateUserUseCase {
  final UserRepository userRepository;

  CreateUser(this.userRepository);
  @override
  Future<Either<Failure, void>> call(User user) async {
    
    return await userRepository.createUser(user);
  }
}
