// import 'dart:async';
// import 'package:clean_nest/core/entities/user.dart';
// import 'package:clean_nest/features/auth/src/domain/usecases/register_user.dart';
// import 'package:injectable/injectable.dart';

// @Injectable()
// class AuthViewmodel {
//   final RegisterUserUseCase registerUserUsecase;
  
//   User? _user;

//   User? get user => _user;

//   AuthViewmodel(this.registerUserUsecase);

//   //Create user
//   Future<void> registerUser(String name, String email, String password) async {
//     await registerUserUsecase.call(name, email, password);
//   }
// }
