import 'package:clean_nest/core/errors/failure.dart';

class StorageError extends Failure {
  StorageError({required String message}) : super(message);
}

class StorageReadError extends StorageError {
  StorageReadError( {required String message}) : super(message: "Erro ao ler os dados do armazenamento.");
}

class StorageWriteError extends StorageError {
  StorageWriteError({required String message})
      : super(message: "Erro ao salvar os dados no armazenamento.");
}

class StorageDeleteError extends StorageError {
  StorageDeleteError({required String message})
      : super(message: "Erro ao remover os dados do armazenamento.");
}
