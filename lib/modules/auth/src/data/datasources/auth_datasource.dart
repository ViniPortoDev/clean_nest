import 'dart:convert';

import 'package:clean_nest/core/data/services/app_storage/shared_preference/shared_preferences_service.dart';
import 'package:clean_nest/core/utils/mock_data.dart';
import 'package:clean_nest/modules/auth/src/data/models/user_model.dart';

abstract class AuthLocalDatasource {
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getCurrentUser();
  Future<void> clearUser();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferencesService sharedPreferencesService;

  AuthLocalDatasourceImpl(this.sharedPreferencesService);

  final UserModel mockUser = UserModel(
    id: 0,
    name: 'Vinicius Porto',
    email: 'vinicius.p.a.corin@gmail.com',
    password: '123',
    groups: [],
  );

  final String _key = "USER_DATA";

  @override
  Future<void> saveUser(UserModel user) async {
    await sharedPreferencesService.saveData(_key, user.toJson());
  }

  @override
  Future<void> clearUser() async {
    await sharedPreferencesService.removeData(_key);
  }

  //TODO get current user mockado
  @override
  Future<UserModel?> getCurrentUser() async {
    return UserModel.fromMap(MockData.userData);
  }

  //   @override
  // Future<UserModel?> getCurrentUser() async {
  //   final userJson = sharedPreferencesService.getData(_key);
  //   if (userJson != null) {
  //     return jsonDecode(userJson);
  //   }
  //   return null;
  // }
}
