import 'package:clean_nest/modules/onboarding/ui/pages/onboarding_page.dart';
import 'package:clean_nest/modules/onboarding/ui/viewmodels/onboarding_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingModule extends Module {

  @override
  void binds(i) {
    // Viewmodels
    i.addSingleton(OnboardingViewModel.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => OnboardingPage(
        onboardingViewModel: context.read(),
      ),
    );
  }
}
