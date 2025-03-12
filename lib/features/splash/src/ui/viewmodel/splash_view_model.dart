// presentation/splash/splash_viewmodel.dart
import 'package:clean_nest/core/services/local_storage/local_storage.dart';
import 'package:clean_nest/core/viewmodel/base_view_model.dart';
import 'package:clean_nest/features/splash/src/usecases/delay_splash_use_case.dart';
import 'package:injectable/injectable.dart';

@Injectable(order: -1)
class SplashViewModel extends BaseViewModel {
  final DelaySplashUseCase delaySplashUseCase;
  final LocalStorage localStorage;

  SplashViewModel({
    required this.delaySplashUseCase,
    required this.localStorage,
  });

  Future<bool> startSplash() async {
    setLoading(true);
    await delaySplashUseCase.execute();
    setLoading(false);
    return true;
  }
}
