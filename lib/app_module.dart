import 'package:clean_nest/modules/home/home_module.dart';
import 'package:clean_nest/modules/splash/src/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/splash', module: SplashModule());
    r.module('/home', module: HomeModule());
  }
}
