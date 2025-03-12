import 'package:clean_nest/core/services/local_storage/local_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: LocalStorage)
class SharedPreferencesService implements LocalStorage {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  @override
  String? getString(String key) => _prefs.getString(key);

  @override
  int? getInt(String key) => _prefs.getInt(key);

  @override
  bool? getBool(String key) => _prefs.getBool(key);

  @override
  Future<void> setString(String key, String value) async =>
      await _prefs.setString(key, value);

  @override
  Future<void> setInt(String key, int value) async =>
      await _prefs.setInt(key, value);

  @override
  Future<void> setBool(String key, bool value) async =>
      await _prefs.setBool(key, value);

  @override
  Future<void> remove(String key) async => await _prefs.remove(key);

  @override
  Future<void> clearAll() async => await _prefs.clear();
}
