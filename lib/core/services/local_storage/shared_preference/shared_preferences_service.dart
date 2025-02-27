import 'package:clean_nest/core/services/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements LocalStorage {
  static SharedPreferences? _prefs;

  Future<SharedPreferences> _getPrefs () async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  @override
  Future<void> setString(String key, String value) async {
    final prefs = await _getPrefs();
    await prefs.setString(key, value);
  }

  @override
     Future<String?> getString(String key) async {
    final prefs = await _getPrefs();
    return prefs.getString(key);
  }

  @override
  Future<void> setInt(String key, int value) async {
    final prefs = await _getPrefs();

    await prefs.setInt(key, value);
  }

  @override
  Future<int?> getInt(String key) async {
    final prefs = await _getPrefs();

    return prefs.getInt(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    final prefs = await _getPrefs();

    await prefs.setBool(key, value);
  }

  @override
 Future <bool?> getBool(String key) async {
    final prefs = await _getPrefs();

    return prefs.getBool(key);
  }

  @override
  Future<void> remove(String key) async {
    final prefs = await _getPrefs();

    await prefs.remove(key);
  }
}
