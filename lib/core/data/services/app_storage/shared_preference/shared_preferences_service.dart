import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences sharedPreferences;

  SharedPreferencesService(this.sharedPreferences);

  Future<void> saveData(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  String? getData(String key) {
    return sharedPreferences.getString(key);
  }

  Future<void> removeData(String key) async {
    await sharedPreferences.remove(key);
  }
}
