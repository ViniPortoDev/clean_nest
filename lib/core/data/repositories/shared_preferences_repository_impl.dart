import 'package:clean_nest/core/domain/repositories/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  final SharedPreferences sharedPreferences;

  SharedPreferencesRepositoryImpl({required this.sharedPreferences});

  @override
  Future<void> saveBool(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }

  @override
  bool getBool(String key, {bool defaultValue = false}) {
    return sharedPreferences.getBool(key) ?? defaultValue;
  }

  @override
  Future<void> saveString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  @override
  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  @override
  Future<void> saveInt(String key, int value) async {
    await sharedPreferences.setInt(key, value);
  }

  @override
  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  @override
  Future<void> saveDouble(String key, double value) async {
    await sharedPreferences.setDouble(key, value);
  }

  @override
  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  @override
  Future<void> remove(String key) async {
    await sharedPreferences.remove(key);
  }

  @override
  Future<void> clear() async {
    await sharedPreferences.clear();
  }
}