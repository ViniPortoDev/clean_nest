import 'package:clean_nest/core/services/local_storage/shared_preference/shared_preferences_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SharedPreferencesService', () {
    late SharedPreferencesService service;

    setUp(() {
      SharedPreferences.setMockInitialValues({'key': 'value'});
      service = SharedPreferencesService();
    });

    test('Deve retornar o valor salvo no SharedPreferences', () async {
      // Act
      final result = await service.getString('key');

      // Assert
      expect(result, 'value');
    });

    // Exemplo de teste negativo para chave não existente
    test('Deve retornar null para chave não existente', () async {
      // Act
      final result = await service.getString('unknown_key');

      // Assert
      expect(result, isNull);
    });
  });
}
