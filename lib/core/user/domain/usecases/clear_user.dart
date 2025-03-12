import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class ClearUserUseCase {
  Future<Either<Failure, void>> call();
}

@Injectable(as: ClearUserUseCase)
class ClearUser implements ClearUserUseCase {
  final UserRepository repository;

  ClearUser(this.repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.clearUser();
  }
}
