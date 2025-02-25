import 'package:clean_nest/core/services/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements LocalStorage {
  final SharedPreferences prefs;

  SharedPreferencesService({required this.prefs});

  @override
  Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  @override
  String? getString(String key) {
    return prefs.getString(key);
  }

  @override
  Future<void> setInt(String key, int value) async {
    await prefs.setInt(key, value);
  }

  @override
  int? getInt(String key) {
    return prefs.getInt(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  @override
  bool? getBool(String key) {
    return prefs.getBool(key);
  }

  @override
  Future<void> remove(String key) async {
    await prefs.remove(key);
  }
}
