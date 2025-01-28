import 'package:clean_nest/core/data/services/local_storage/shared_preference/shared_preferences_service.dart';
import 'package:clean_nest/modules/auth/src/auth_module.dart';
import 'package:clean_nest/modules/home/home_module.dart';
import 'package:clean_nest/modules/onboarding/onboarding_module.dart';
import 'package:clean_nest/modules/splash/src/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addInstance(SharedPreferencesService()..init());
  }

  @override
  void routes(r) {
    r.module('/splash', module: SplashModule());
    r.module('/onboarding', module: OnboardingModule());
    r.module('/auth', module: AuthModule());
    r.module('/home', module: HomeModule());
  }
}
