import 'package:clean_nest/features/auth/src/domain/usecases/register_user.dart';
import 'package:clean_nest/features/auth/src/ui/bloc/auth/auth_event.dart';
import 'package:clean_nest/features/auth/src/ui/bloc/auth/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUserUseCase _registerUserUseCase;

  AuthBloc({
    required RegisterUserUseCase registerUserUseCase,
  })  : _registerUserUseCase = registerUserUseCase,
        super(const AuthInitial()) {
    on<AuthCheckStatus>(_onCheckStatus);
    on<AuthRegisterRequested>(_onRegisterRequested);
    on<AuthLogout>(_onLogout);
  }

  Future<void> _onCheckStatus(
    AuthCheckStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    // Aqui você poderia verificar o localStorage ou qualquer outro armazenamento
    // para ver se o usuário já está autenticado
    // Por exemplo:
    // final savedUser = await _localStorageService.getUser();

    // Para simplificar, vamos assumir que o usuário não está autenticado inicialmente
    emit(const AuthUnauthenticated());
  }

  Future<void> _onRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    try {
      final result = await _registerUserUseCase.call(
        event.name,
        event.email,
        event.password,
      );

      return result.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (user) => emit(AuthRegistrationSuccess(user)),
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _onLogout(
    AuthLogout event,
    Emitter<AuthState> emit,
  ) {
    // Implementação do logout
    // Por exemplo: _localStorageService.clearUser();
    emit(const AuthUnauthenticated());
  }
}
