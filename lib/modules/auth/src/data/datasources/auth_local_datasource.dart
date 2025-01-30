import 'dart:convert';
import 'package:clean_nest/core/entities/mascot.dart';
import 'package:clean_nest/core/services/local_storage/shared_preference/shared_preferences_service.dart';
import 'package:clean_nest/core/models/user_model.dart';

abstract class AuthLocalDatasource {
  Future<void> saveUser(Map<String, dynamic> user);
  Future<UserModel?> getCurrentUser();
  Future<void> clearUser();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferencesService sharedPreferencesService;

  AuthLocalDatasourceImpl(this.sharedPreferencesService);

  final String _userKey = "USER_DATA";

  @override
  Future<UserModel?> getCurrentUser() async {
    final userJson = sharedPreferencesService.getString(_userKey);
    if (userJson != null) {
      return UserModel.fromMap(jsonDecode(userJson));
    }
    return null;
  }

  @override
  Future<void> saveUser(Map<String, dynamic> user) async {
    await sharedPreferencesService.saveString(_userKey, jsonEncode(user));
  }

  @override
  Future<void> clearUser() async {
    await sharedPreferencesService.remove(_userKey);
  }
}
