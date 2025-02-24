import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/models/user_model.dart';
import 'package:clean_nest/core/services/errors/storage_error.dart';
import 'package:clean_nest/core/services/local_storage/local_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract class UserLocalDatasource {
  Future<Either<Failure, void>> saveUser(UserModel user);
  Future<Either<Failure, UserModel?>> getCurrentUser();
  Future<Either<Failure, void>> clearUser();
}

class UserLocalDatasourceImpl implements UserLocalDatasource {
  final Logger logger = Logger();
  final LocalStorage localStorage;
  UserLocalDatasourceImpl({required this.localStorage});

  // Get user from local storage
  @override
  Future<Either<Failure, UserModel?>> getCurrentUser() async {
    try {
      String? user = localStorage.getString('user');
      if (user != null) {
        return Right(UserModel.fromMap(jsonDecode(user)));
      }
      return right(null);
    } catch (e) {
      if (kDebugMode) {
        logger.d("Erro ao obter usuário: $e");
      } else {
        logger.e("Erro ao obter usuário: [Erro interno]");
      }
      return left(StorageReadError(message: 'Erro ao obter usuário'));
    }
  }

  // Save user to local storage
  @override
  Future<Either<Failure, void>> saveUser(UserModel user) async {
    try {
      await localStorage.setString('user', jsonEncode(user.toMap()));
      return right(null);
    } catch (e) {
      if (kDebugMode) {
        logger.d("Erro ao salvar usuário: $e");
      } else {
        logger.e("Erro ao salvar usuário: [Erro interno]");
      }
      return left(StorageWriteError(message: 'Erro ao salvar usuário'));
    }
  }

 

  // Clear user from local storage
  @override
  Future<Either<Failure, void>> clearUser() async {
    try {
      await localStorage.remove('user');
      return right(null);
    } catch (e) {
      if (kDebugMode) {
        logger.d("Erro ao remover usuário: $e");
      } else {
        logger.e("Erro ao remover usuário: [Erro interno]");
      }
      return Left(StorageClearError(message: 'Erro ao remover usuário'));
    }
  }
}
