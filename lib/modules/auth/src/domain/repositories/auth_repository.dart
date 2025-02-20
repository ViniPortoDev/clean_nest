import 'package:clean_nest/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_nest/core/entities/user.dart';

abstract class AuthRepository {
  // Método para criar o usuário
  Future<Either<Failure, void>> createUser(User user);

  // Método para fazer login
  Future<Either<Failure, User>> login(String email, String password);

  // Método para logout
  Future<Either<Failure, void>> logout();


}
