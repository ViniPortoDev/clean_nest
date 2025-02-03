import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class CreateUserUsecase {
  Future<Either<Failure, void>> call(String name, String email, String password);
}

class CreateUser implements CreateUserUsecase {
  final AuthRepository _authRepository;

  CreateUser(this._authRepository);

  @override
  Future<Either<Failure, void>> call(String name, String email, String password) async {
    // Criação do usuário
    final user = User(
      id: 1,
      name: name,
      email: email,
      password: password,
      mascot: Mascot(
        id: 1,
        name: 'Mascot A',
        imageUrl: 'assets/images/logo_elizeu.png',
      ),
      groups: [],
    );

    // Chamada ao repositório para criar o usuário
    return await _authRepository.createUser(user);
  }
}
