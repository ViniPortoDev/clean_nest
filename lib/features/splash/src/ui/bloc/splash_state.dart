import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();
}

class SplashInitial extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashLoading extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashLoaded extends SplashState {
  @override
  List<Object> get props => [];
}

class SplashError extends SplashState {
  final String message;
  const SplashError(this.message);

  @override
  List<Object> get props => [message];
}
