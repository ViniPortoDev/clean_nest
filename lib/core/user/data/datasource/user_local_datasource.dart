import 'dart:convert';

import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/models/user_model.dart';
import 'package:clean_nest/core/services/errors/storage_error.dart';
import 'package:clean_nest/core/services/local_storage/local_storage.dart';
import 'package:dartz/dartz.dart';

abstract class UserLocalDataSource {
  Future<Either<Failure, void>> saveUser(UserModel user);
  Future<Either<Failure, void>> updateUser(UserModel user);
  Future<Either<Failure, UserModel?>> getCurrentUser();
  Future<Either<Failure, void>> clearUser();

}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final LocalStorage localStorage;

  UserLocalDataSourceImpl({required this.localStorage});
  @override
  Future<Either<Failure, UserModel?>> getCurrentUser() async {
    try {
      String? user = await localStorage.getString('user');
      if (user != null) {
        return Right(UserModel.fromMap(jsonDecode(user)));
      }
      return right(null);
    } catch (e) {
      return left(StorageReadError(message: 'Erro ao obter usuário'));
    }
  }

  @override
  Future<Either<Failure, void>> saveUser(UserModel user) async{
    try {
    await localStorage.saveString('user', jsonEncode(user.toMap()));
      return right(null);
    } catch (e) {
      return left(StorageWriteError(message: 'Erro ao salvar usuário'));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(UserModel user) async {
    try {
      await localStorage.saveString('user', jsonEncode(user.toMap()));
      return right(null);
    } catch (e) {
      return left(StorageWriteError(message: 'Erro ao atualizar usuário'));
    }
  }
  
  @override
  Future<Either<Failure, void>> clearUser() async{
    try {
      await localStorage.remove('user');
      return right(null);
    } catch (e) {
      return left(StorageDeleteError(message: 'Erro ao remover usuário'));
    }
  }
}
