import 'package:clean_nest/core/services/errors/storage_error.dart';
import 'package:clean_nest/core/user/domain/repositories/user_repository.dart';
import 'package:clean_nest/core/user/domain/usecases/clear_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'clear_user_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late ClearUser useCase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    useCase = ClearUser(mockUserRepository);
  });

  group('ClearUser', () {
    test('Deve limpar os dados do usuário com sucesso', () async {
      // Arrange
      when(mockUserRepository.clearUser())
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await useCase.call();

      // Assert
      expect(result, const Right(null));
      verify(mockUserRepository.clearUser()).called(1);
      verifyNoMoreInteractions(mockUserRepository);
    });

    test('Deve retornar StorageClearError com mensagem correta ao falhar',
        () async {
      // Arrange
      const failureMessage = "Erro ao remover os dados do armazenamento.";
      final failure = StorageClearError(message: failureMessage);
      when(mockUserRepository.clearUser())
          .thenAnswer((_) async => Left(failure));

      // Act
      final result = await useCase.call();

      // Assert
      expect(result, Left(failure));
      result.fold(
        (f) {
          expect(f, isA<StorageClearError>());
          expect(f.message, failureMessage); 
        },
        (_) => fail('Deveria retornar Failure'),
      );
      verify(mockUserRepository.clearUser()).called(1);
    });
  });
}
