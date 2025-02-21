import 'dart:async';
import 'package:clean_nest/core/entities/user.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/register_user.dart';

class AuthViewmodel extends BaseViewModel {
  final RegisterUserUseCase registerUserUsecase;
  
  User? _user;

  User? get user => _user;

  AuthViewmodel(this.registerUserUsecase);

  //Create user
  Future<void> registerUser(String name, String email, String password) async {
    await registerUserUsecase.call(name, email, password);
  }
}
