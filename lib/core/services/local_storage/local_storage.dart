abstract class LocalStorage {
  String? getString(String key);
  int? getInt(String key);
  bool? getBool(String key);

  Future<void> saveString(String key, String value);
  Future<void> saveBool(String key, bool value);
  Future<void> saveInt(String key, int value);
  Future<void> remove(String key);
}
