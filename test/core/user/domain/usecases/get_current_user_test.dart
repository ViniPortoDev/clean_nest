import 'package:clean_nest/core/services/local_storage/shared_preference/shared_preferences_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SharedPreferencesService', () {
    late SharedPreferencesService service;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      service = SharedPreferencesService();
      await service.clearAll();
    });

    // Teste para getString e setString
    test('Deve salvar e recuperar uma String corretamente', () async {
      // Arrange
      const key = 'test_key';
      const value = 'test_value';

      // Act
      await service.setString(key, value);
      final result = await service.getString(key);

      // Assert
      expect(result, value);
    });

    test('Deve retornar null para uma chave não existente (String)', () async {
      final result = await service.getString('unknown_key');
      expect(result, isNull);
    });

    // Teste para getInt e setInt
    test('Deve salvar e recuperar um int corretamente', () async {
      const key = 'int_key';
      const value = 42;

      await service.setInt(key, value);
      final result = await service.getInt(key);

      expect(result, value);
    });

    test('Deve retornar null para uma chave não existente (int)', () async {
      final result = await service.getInt('unknown_key');
      expect(result, isNull);
    });

    // Teste para getBool e setBool
    test('Deve salvar e recuperar um bool corretamente', () async {
      const key = 'bool_key';
      const value = true;

      await service.setBool(key, value);
      final result = await service.getBool(key);

      expect(result, value);
    });

    test('Deve retornar null para uma chave não existente (bool)', () async {
      final result = await service.getBool('unknown_key');
      expect(result, isNull);
    });

    // Teste para remove
    test('Deve remover uma chave corretamente', () async {
      const key = 'to_remove';
      await service.setString(key, 'value');

      await service.remove(key);
      final result = await service.getString(key);

      expect(result, isNull);
    });

    // Teste para clearAll
    test('Deve limpar todos os dados', () async {
      await service.setString('key1', 'value1');
      await service.setInt('key2', 2);

      await service.clearAll();

      expect(await service.getString('key1'), isNull);
      expect(await service.getInt('key2'), isNull);
    });
  });
}
