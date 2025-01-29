import 'dart:async';

import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/create_user.dart';

class AuthViewmodel extends BaseViewModel {
  final CreateUserUsecase createUserUsecase;

  AuthViewmodel({

    required this.createUserUsecase,
  });

  //Instance of user
  User? _user;

  User? get user => _user;

  //Create user
  Future<void> createUser(String name, String email, String password) async {
    await createUserUsecase.call(name, email, password);
  }


}
