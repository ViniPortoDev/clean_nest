import 'package:clean_nest/core/utils/mock_data.dart';
import 'package:clean_nest/core/models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> login(String email, String password);
  Future<void> logout();
  Future<void> register(UserModel user);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<void> register(UserModel user) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final mock = MockData.userData;

    if (email == mock['email'] && password == mock['password']) {
      final userModel = UserModel.fromMap(mock);
      return userModel;
    } else {
      throw Exception('Credenciais inválidas.');
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
