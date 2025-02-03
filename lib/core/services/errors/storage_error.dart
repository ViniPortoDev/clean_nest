import 'package:clean_nest/core/errors/failure.dart';

class StorageError extends Failure {
  StorageError({required String message}) : super('Erro de armazenamento: $message');
}
