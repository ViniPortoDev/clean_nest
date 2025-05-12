
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override 
  List<Object?> get props => [];
}

class AuthRegisterRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const AuthRegisterRequested({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
}

class AuthCheckStatus extends AuthEvent {
  const AuthCheckStatus();
}

class AuthLogout extends AuthEvent {
  const AuthLogout();
}





