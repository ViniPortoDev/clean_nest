import 'package:clean_nest/modules/splash/src/ui/page/splash_page.dart';
import 'package:clean_nest/modules/splash/src/ui/viewmodel/splash_view_model.dart';
import 'package:clean_nest/modules/splash/src/usecases/delay_splash_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  void binds(i) {
    i.add(DelaySplashUseCase.new);
    i.addSingleton(SplashViewModel.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
  }
}
