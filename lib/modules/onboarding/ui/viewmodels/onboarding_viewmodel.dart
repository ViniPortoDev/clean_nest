import 'package:clean_nest/core/data/repositories/shared_preferences_repository_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingViewModel extends ChangeNotifier {
  final SharedPreferencesRepositoryImpl sharedPreferencesRepository;

  OnboardingViewModel({required this.sharedPreferencesRepository});
  Future<void> completeOnboarding() async {
    await sharedPreferencesRepository.saveBool('isFirstLaunch', false);
    Modular.to.navigate('/home');
  }
}
