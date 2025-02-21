import 'dart:async';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/register_user.dart';

class AuthViewmodel extends BaseViewModel {
  final CreateUserUsecase createUserUsecase;

  AuthViewmodel(this.createUserUsecase);

  //Create user
  Future<void> createUser(String name, String email, String password) async {
    await createUserUsecase.call(name, email, password);
  }
}
