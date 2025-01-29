import 'package:clean_nest/core/services/local_storage/shared_preference/shared_preferences_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingViewModel extends ChangeNotifier {
  final SharedPreferencesService sharedPreferencesRepository;

  OnboardingViewModel({required this.sharedPreferencesRepository});
  Future<void> completeOnboarding() async {
    await sharedPreferencesRepository.saveBool('isFirstLaunch', false);
    Modular.to.navigate('/home');
  }
}
