import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  final SharedPreferences sharedPreferences;

  // Inicializa o repositório com o SharedPreferences
  SharedPreferencesRepository({required this.sharedPreferences});

  // Função para salvar um valor booleano
  Future<void> saveBool(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }

  // Função para pegar um valor booleano
  bool getBool(String key, {bool defaultValue = false}) {
    return sharedPreferences.getBool(key) ?? defaultValue;
  }

  // Função para salvar um valor de String
  Future<void> saveString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  // Função para pegar um valor de String
  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  // Função para salvar um valor de inteiro
  Future<void> saveInt(String key, int value) async {
    await sharedPreferences.setInt(key, value);
  }

  // Função para pegar um valor de inteiro
  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  // Função para salvar um valor de double
  Future<void> saveDouble(String key, double value) async {
    await sharedPreferences.setDouble(key, value);
  }

  // Função para pegar um valor de double
  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  // Função para remover um valor
  Future<void> remove(String key) async {
    await sharedPreferences.remove(key);
  }

  // Função para limpar todas as preferências
  Future<void> clear() async {
    await sharedPreferences.clear();
  }
}
