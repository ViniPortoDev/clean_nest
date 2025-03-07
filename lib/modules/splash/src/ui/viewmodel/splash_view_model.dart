// presentation/splash/splash_viewmodel.dart
import 'package:clean_nest/core/services/local_storage/local_storage.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/modules/splash/src/usecases/delay_splash_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashViewModel extends BaseViewModel {
  final DelaySplashUseCase delaySplashUseCase;
  final LocalStorage localStorage;

  SplashViewModel({
    required this.delaySplashUseCase,
    required this.localStorage,
  });

  void startSplash() async {
    setLoading(true);
    await delaySplashUseCase.execute();
    bool isFirstLaunch = await localStorage.getBool('isFirstLaunch') ?? true;
    setLoading(false);

    Modular.to.navigate(isFirstLaunch ? '/onboarding/' : '/auth/');
  }
}
