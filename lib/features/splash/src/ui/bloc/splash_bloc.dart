import 'package:clean_nest/features/splash/src/ui/bloc/splash_event.dart';
import 'package:clean_nest/features/splash/src/ui/bloc/splash_state.dart';
import 'package:clean_nest/features/splash/src/usecases/delay_splash_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final DelaySplashUseCase _delaySplashUseCase;
  SplashBloc({
    required DelaySplashUseCase delaySplashUseCase,
  })  : _delaySplashUseCase = delaySplashUseCase,
        super(SplashInitial()) {
    on<SplashStarted>(startupDelay);
  }

  Future<void> startupDelay(
      SplashStarted event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    await _delaySplashUseCase.execute();
    emit(SplashLoaded());
  }
}
