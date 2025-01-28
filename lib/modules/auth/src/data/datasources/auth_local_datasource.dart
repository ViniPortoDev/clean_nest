import 'dart:convert';
import 'package:clean_nest/core/data/services/local_storage/shared_preference/shared_preferences_service.dart';
import 'package:clean_nest/modules/auth/src/data/models/user_model.dart';

abstract class AuthLocalDatasource {
  Future<void> saveUser(Map<String, dynamic> user);
  Future<UserModel?> getCurrentUser();
  Future<void> clearUser();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferencesService sharedPreferencesService;

  AuthLocalDatasourceImpl(this.sharedPreferencesService);

  final String _key = "USER_DATA";

  @override
  Future<UserModel?> getCurrentUser() async {
    final userJson = sharedPreferencesService.getString(_key);
    if (userJson != null) {
      return jsonDecode(userJson);
    }
    return null;
  }

  @override
  Future<void> saveUser(Map<String, dynamic> user) async {
    await sharedPreferencesService.saveString(_key, jsonEncode(user));
  }

  @override
  Future<void> clearUser() async {
    await sharedPreferencesService.remove(_key);
  }
}
