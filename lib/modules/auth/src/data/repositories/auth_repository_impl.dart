import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/modules/auth/src/data/datasources/auth_remote_datasource.dart';
import 'package:clean_nest/modules/auth/src/data/models/user_model.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';

import '../datasources/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource localDatasource;
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl(this.localDatasource, this.remoteDatasource);

  @override
  Future<void> createUser(User user) async {
    final userModel = UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
      groups: [],
    );
    await localDatasource.saveUser(userModel.toMap());
  }

  @override
  Future<User> login(String email, String password) async {
    final userModel = await remoteDatasource.login(email, password);
    final user = User(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
      password: userModel.password,
      groups: userModel.groups,
    );
    return user;
  }

  @override
  Future<void> logout() async {
    await remoteDatasource.logout();
    await localDatasource.clearUser();
  }

  @override
  Future<User?> getCurrentUser() async {
    final userModel = await localDatasource.getCurrentUser();
    if (userModel != null) {
      return User(
        id: userModel.id,
        name: userModel.name,
        email: userModel.email,
        password: userModel.password,
        groups: userModel.groups,
      );
    }
    return null;
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
