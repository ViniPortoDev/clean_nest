import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/modules/auth/src/data/datasources/auth_remote_datasource.dart';
import 'package:clean_nest/modules/auth/src/data/models/user_model.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';

import '../datasources/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDatasource localDatasource;
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl(this.localDatasource, this.remoteDatasource);

  //createUser method
  @override
  Future<void> createUser(User user) async {
    final userModel = UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
      mascot: Mascot(
        id: 1,
        name: 'Mascot 1',
        imageUrl: 'assets/images/logo_elizeu.png',
      ),
      groups: [],
    );
    await localDatasource.saveUser(userModel.toMap());
  }

  //updateUser method
  @override
  Future<void> updateUser(User user) {
    final userModel = UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      password: user.password,
      mascot: user.mascot,
      groups: user.groups,
    );
    return localDatasource.saveUser(userModel.toMap());
  }

  //login method
  @override
  Future<User> login(String email, String password) async {
    final userModel = await remoteDatasource.login(email, password);
    final user = User(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
      password: userModel.password,
      mascot: userModel.mascot,
      groups: userModel.groups,
    );
    return user;
  }

  //logout method
  @override
  Future<void> logout() async {
    await remoteDatasource.logout();
    await localDatasource.clearUser();
  }

  //getCurrentUser method
  @override
  Future<User?> getCurrentUser() async {
    final userModel = await localDatasource.getCurrentUser();
    if (userModel != null) {
      return User(
        id: userModel.id,
        name: userModel.name,
        email: userModel.email,
        password: userModel.password,
        mascot: userModel.mascot,
        groups: userModel.groups,
      );
    }
    return null;
  }
}
