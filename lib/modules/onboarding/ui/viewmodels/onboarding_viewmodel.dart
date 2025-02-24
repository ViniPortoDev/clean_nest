import 'package:clean_nest/core/services/local_storage/local_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingViewModel extends ChangeNotifier {
  final LocalStorage localStorage;

  OnboardingViewModel({required this.localStorage});
  Future<void> completeOnboarding() async {
    await localStorage.setBool('isFirstLaunch', false);
    Modular.to.navigate('/home');
  }
}
