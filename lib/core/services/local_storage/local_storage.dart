abstract class LocalStorage {
  // Síncronos para leitura
  String? getString(String key);
  int? getInt(String key);
  bool? getBool(String key);

  // Assíncronos para escrita
  Future<void> setString(String key, String value);
  Future<void> setBool(String key, bool value);
  Future<void> setInt(String key, int value);
  Future<void> remove(String key);
  Future<void> clearAll();
}