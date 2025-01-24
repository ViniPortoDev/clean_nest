import 'package:clean_nest/core/domain/entities/user.dart';

import '../repositories/auth_repository.dart';

abstract class GetLoggedUser {
  Future<User?> execute();
}


class GetLoggedUserImpl implements GetLoggedUser {
  final AuthRepository repository;

  GetLoggedUserImpl(this.repository);

  @override
  Future<User?> execute() async {
    return await repository.getLoggedUser();
  }
}
