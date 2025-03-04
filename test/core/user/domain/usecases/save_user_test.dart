import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/services/errors/storage_error.dart';
import 'package:clean_nest/core/user/domain/repositories/user_repository.dart';
import 'package:clean_nest/core/user/domain/usecases/save_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_user_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late SaveUser useCase;
  late MockUserRepository mockUserRepository;

  final user = User(
    id: 1,
    name: 'Test User',
    email: 'email.test@test.com',
    password: '123456',
    groups: [],
  );

  setUp(() {
    mockUserRepository = MockUserRepository();
    useCase = SaveUser(mockUserRepository);
  });

  group('SaveUser', () {
    test('Deve salvar o usuário com sucesso', () async {
      // Arrange
      when(mockUserRepository.saveUser(user))
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await useCase.call(user);

      // Assert
      expect(result, const Right(null));
      verify(mockUserRepository.saveUser(user)).called(1);
      verifyNoMoreInteractions(mockUserRepository);
    });

    test('Deve retornar StorageWriteError com mensagem correta ao falhar',
        () async {
      // Arrange
      const failureMessage = "Erro ao salvar os dados no armazenamento.";
      final failure = StorageWriteError(message: failureMessage);

      // Verifica o parâmetro exato e a mensagem
      when(mockUserRepository.saveUser(argThat(equals(user))))
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await useCase.call(user);

      // Assert
      expect(result, Left(failure));
      result.fold(
        (f) {
          expect(f, isA<StorageWriteError>());
          expect(f.message, failureMessage);
        },
        (_) => fail('Deveria retornar Failure'),
      );
      verify(mockUserRepository.saveUser(user)).called(1);
      verifyNoMoreInteractions(mockUserRepository);
    });
  });
}
