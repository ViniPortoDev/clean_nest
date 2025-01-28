import 'package:clean_nest/core/utils/mock_data.dart';
import 'package:clean_nest/modules/auth/src/data/models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> login(String email, String password);
  Future<void> createUser(Map<String, dynamic> user);
  Future<void> logout();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<void> createUser(Map<String, dynamic> user) {
    // TODO: implement createUser
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
