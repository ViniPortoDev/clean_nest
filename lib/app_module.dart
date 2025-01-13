import 'package:clean_nest/core/core_module.dart';
import 'package:clean_nest/core/data/repositories/shared_preferences_repository.dart';
import 'package:clean_nest/modules/auth/src/auth_module.dart';
import 'package:clean_nest/modules/home/home_module.dart';
import 'package:clean_nest/modules/onboarding/onboarding_module.dart';
import 'package:clean_nest/modules/splash/src/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module {

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/splash', module: SplashModule());
    r.module('/onboarding', module: OnboardingModule());
    r.module('/auth', module: AuthModule());
    r.module('/home', module: HomeModule());
  }
}
