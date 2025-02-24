import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> saveUser(User user);
  Future<Either<Failure, User?>> getCurrentUser();
  Future<Either<Failure, void>> clearUser();
}
