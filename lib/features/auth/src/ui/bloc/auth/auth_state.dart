import 'package:clean_nest/core/entities/user.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  final User user;

  const AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthRegistrationSuccess extends AuthState {
  final User user;

  const AuthRegistrationSuccess(this.user);

  @override
  List<Object?> get props => [user];
}