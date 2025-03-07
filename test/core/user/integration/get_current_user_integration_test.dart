import 'package:clean_nest/core/models/user_model.dart';
import 'package:clean_nest/core/services/local_storage/shared_preference/shared_preferences_service.dart';
import 'package:clean_nest/core/user/data/datasource/user_local_datasource.dart';
import 'package:clean_nest/core/user/data/repositories/user_repository_impl.dart';
import 'package:clean_nest/core/user/domain/usecases/get_current_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Integração: GetCurrentUser', () {
    late SharedPreferencesService localStorage;
    late UserLocalDatasourceImpl datasource;
    late UserRepositoryImpl repository;
    late GetCurrentUser useCase;

    // Configuração inicial
    setUp(() async {
      // Configura o SharedPreferences vazio
      SharedPreferences.setMockInitialValues({});
      localStorage = SharedPreferencesService();
      await localStorage.clearAll();

      // Cadeia de dependências reais (sem mocks)
      datasource = UserLocalDatasourceImpl(localStorage: localStorage);
      repository = UserRepositoryImpl(userLocalDataSource: datasource);
      useCase = GetCurrentUser(repository);
    });

    test('Deve recuperar o usuário salvo no SharedPreferences', () async {
      // Arrange: Salva um usuário diretamente no datasource
      final user = UserModel(
        id: 1,
        name: 'Test User',
        email: 'test@test.com',
        password: '123456',
        groups: [],
      );
      await datasource.saveUser(user);

      // Act: Chama o use case
      final result = await useCase.call();

      // Assert: Verifica o resultado
      result.fold(
        (failure) => fail('Deveria retornar o usuário, mas retornou $failure'),
        (userResult) {
          expect(userResult, isNotNull);
          expect(userResult!.id, 1);
          expect(userResult.name, 'Test User');
        },
      );
    });

    test('Deve retornar null quando não houver usuário salvo', () async {
      // Act: Chama o use case sem salvar dados
      final result = await useCase.call();

      // Assert
      result.fold(
        (failure) => fail('Deveria retornar null, mas retornou $failure'),
        (userResult) => expect(userResult, null),
      );
    });
  });
}
