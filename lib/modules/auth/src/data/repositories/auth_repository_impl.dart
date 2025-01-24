import 'package:clean_nest/core/domain/entities/user.dart';
import 'package:clean_nest/modules/auth/src/data/models/user_model.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';

import '../datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource localDatasource;

  AuthRepositoryImpl(this.localDatasource);

 
  @override
  Future<User> createUser() async {
    final user =  User(
      id: mockUser.id,
      name: mockUser.name,
      email: mockUser.email,
      password: mockUser.password,
      groups: mockUser.groups,
    );
    await localDatasource.saveUser(user);

    return user;
  }

  @override
  Future<void> login(User user) async {
    final userJson = {'id': user.id, 'name': user.name, 'email': user.email};
    await localDatasource.saveUser(userJson);
  }

  @override
  Future<void> logout() async {
    await localDatasource.clearUser();
  }

  // @override
  // Future<User?> getLoggedUser() async {
  //   final userJson = await localDatasource.getUser();
  //   if (userJson != null) {
  //     return User(
  //       id: userJson['id'],
  //       name: userJson['name'],
  //       email: userJson['email'],
  //       groups: userJson['groups'],
  //     );
  //   }
  //   return null;
  // }
}
