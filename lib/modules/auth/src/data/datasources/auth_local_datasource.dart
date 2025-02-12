import 'dart:convert';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/models/user_model.dart';
import 'package:clean_nest/core/services/errors/storage_error.dart';
import 'package:clean_nest/core/services/local_storage/shared_preference/shared_preferences_service.dart';
import 'package:dartz/dartz.dart';

abstract class AuthLocalDatasource {
  Future<Either<Failure, void>> saveUser(Map<String, dynamic> user);
  Future<Either<Failure, UserModel?>> getCurrentUser();
  Future<Either<Failure, void>> clearUser();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final SharedPreferencesService sharedPreferencesService;

  AuthLocalDatasourceImpl(this.sharedPreferencesService);

  final String _userKey = "USER_DATA";

  @override
  Future<Either<Failure, UserModel?>> getCurrentUser() async {
    try {
      final userJson = sharedPreferencesService.getString(_userKey);
      if (userJson != null) {
        try {
          return Right(UserModel.fromMap(jsonDecode(userJson)));
        } catch (e) {
          return Left(StorageReadError(
              message: 'Erro ao decodificar os dados de usuário.'));
        }
      }
      return Left(StorageReadError(
          message: 'Usuário não encontrado no armazenamento local.'));
    } catch (e) {
      return Left(StorageReadError(
          message: 'Erro ao buscar o usuário no armazenamento local.'));
    }
  }

  @override
  Future<Either<Failure, void>> saveUser(Map<String, dynamic> user) async {
    try {
      await sharedPreferencesService.saveString(_userKey, jsonEncode(user));
      return const Right(null); // Retorna sucesso sem valor adicional
    } catch (e) {
      return Left(StorageWriteError(
          message: 'Erro ao salvar o usuário no armazenamento local.'));
    }
  }

  @override
  Future<Either<Failure, void>> clearUser() async {
    try {
      await sharedPreferencesService.remove(_userKey);
      return const Right(null); // Retorna sucesso sem valor adicional
    } catch (e) {
      return Left(StorageDeleteError(
          message: 'Erro ao limpar o usuário do armazenamento local.'));
    }
  }
}
