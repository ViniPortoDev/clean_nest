import 'package:clean_nest/core/core_module.dart';
import 'package:clean_nest/modules/splash/src/ui/page/splash_page.dart';
import 'package:clean_nest/modules/splash/src/ui/viewmodel/splash_view_model.dart';
import 'package:clean_nest/modules/splash/src/usecases/delay_splash_use_case.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashModule extends Module {
    final SharedPreferences prefs;

  SplashModule({required this.prefs});

  @override
  List<Module> get imports => [CoreModule(prefs: prefs)];

  @override
  void binds(i) {
    // ViewModels
    i.addSingleton(SplashViewModel.new);

    // UseCases
    i.add(DelaySplashUseCase.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => SplashPage(
        splashViewModel: context.read(),
      ),
    );
  }
}
