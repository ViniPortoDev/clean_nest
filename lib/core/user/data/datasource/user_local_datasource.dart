import 'dart:convert';
import 'package:logger/logger.dart';
import 'package:clean_nest/core/errors/failure.dart';
import 'package:clean_nest/core/models/user_model.dart';
import 'package:clean_nest/core/services/errors/storage_error.dart';
import 'package:clean_nest/core/services/local_storage/local_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract class UserLocalDataSource {
  Future<Either<Failure, void>> saveUser(UserModel user);
  Future<Either<Failure, void>> updateUser(UserModel user);
  Future<Either<Failure, UserModel?>> getCurrentUser();
  Future<Either<Failure, void>> clearUser();
  Future<Either<Failure, void>> createUser(UserModel user);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final Logger logger = Logger();
  final LocalStorage localStorage;
  UserLocalDataSourceImpl({required this.localStorage});

  //Verify if user already exists and Create a new user
  @override
  Future<Either<Failure, void>> createUser(UserModel user) async {
    try {
      final currentUser = await getCurrentUser();
      return currentUser.fold(
        (failure) => Left(failure),
        (existingUser) {
          if (existingUser != null) {
            return Left(StorageWriteError(message: 'Usuário já existe'));
          } else {
            return saveUser(user);
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        logger.d("Erro ao criar usuário: $e");
      } else {
        logger.e("Erro ao criar usuário: [Erro interno]");
      }
      return Left(StorageWriteError(message: 'Erro ao criar usuário: $e'));
    }
  }

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

  // Update user in local storage
  @override
  Future<Either<Failure, void>> updateUser(UserModel user) async {
    try {
      final currentUser = await getCurrentUser();

      return currentUser.fold(
        (failure) => Left(failure),
        (existingUser) async {
          if (existingUser == null) {
            return Left(StorageWriteError(message: 'Usuário não encontrado'));
          } else {
            final userJson = jsonEncode(user.toMap());
            await localStorage.setString('user', userJson);
            return right(null);
          }
        },
      );
    } catch (e) {
      if (kDebugMode) {
        logger.d("Erro ao atualizar usuário: $e");
      } else {
        logger.e("Erro ao atualizar usuário: [Erro interno]");
      }
      return Left(StorageWriteError(message: 'Erro ao atualizar usuário'));
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
