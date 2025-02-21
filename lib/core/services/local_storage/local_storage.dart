abstract class LocalStorage {
  String? getString(String key);
  int? getInt(String key);
  bool? getBool(String key);

  Future<void> setString(String key, String value);
  Future<void> setBool(String key, bool value);
  Future<void> setInt(String key, int value);
  Future<void> remove(String key);
}
