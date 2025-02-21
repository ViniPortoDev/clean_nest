// presentation/splash/splash_viewmodel.dart
import 'package:clean_nest/core/services/local_storage/shared_preference/shared_preferences_service.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/modules/splash/src/usecases/delay_splash_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashViewModel extends BaseViewModel {
  final DelaySplashUseCase delaySplashUseCase;
  final SharedPreferencesService preferencesService;

  SplashViewModel(
      {required this.delaySplashUseCase, required this.preferencesService});

  void startSplash() async {
    setLoading(true);
    await delaySplashUseCase.execute();
    bool? isFirstLaunch = preferencesService.getBool('isFirstLaunch');
    setLoading(false);

    if (isFirstLaunch!) {
      Modular.to.pushNamedAndRemoveUntil('/onboarding/', (route) => false);
    } else {
      Modular.to.pushNamedAndRemoveUntil('/home/', (route) => false);
    }
  }
}
