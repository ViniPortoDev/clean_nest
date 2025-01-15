// presentation/splash/splash_viewmodel.dart
import 'package:clean_nest/core/data/repositories/shared_preferences_repository.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/modules/splash/src/usecases/delay_splash_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashViewModel extends BaseViewModel {
  final DelaySplashUseCase delaySplashUseCase;
  final SharedPreferencesRepository sharedPrefsRepo;

  SplashViewModel(
      {required this.delaySplashUseCase, required this.sharedPrefsRepo});

  void startSplash() async {
    setLoading(true);
    await delaySplashUseCase.execute();
    bool isFirstLaunch = sharedPrefsRepo.getBool('isFirstLaunch');
    setLoading(false);

    //TODO tirar a "!" do isFirstLaunch
    if (!isFirstLaunch) {
      Modular.to.pushNamed('/onboarding/');
    } else {
      Modular.to.pushNamed('/home/');
    }
  }
}
