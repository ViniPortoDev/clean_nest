// presentation/splash/splash_viewmodel.dart
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/modules/splash/src/usecases/delay_splash_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashViewModel extends BaseViewModel {
  final DelaySplashUseCase _delaySplashUseCase;

  SplashViewModel(this._delaySplashUseCase);

  void startSplash() async {
    setLoading(true);
    await _delaySplashUseCase.execute();
    Modular.to.pushNamed('/home/');
    setLoading(false);
  }
}
