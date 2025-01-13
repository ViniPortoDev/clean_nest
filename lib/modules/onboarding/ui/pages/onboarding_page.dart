import 'package:clean_nest/modules/onboarding/ui/viewmodels/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingViewModel onboardingViewModel;
  const OnboardingPage({super.key, required this.onboardingViewModel});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        _buildPageModel(
          title: 'Organize suas tarefas',
          body: 'Distribua as tarefas de forma justa e intuitiva.',
          imagePath: 'assets/images/news.png',
        ),
        _buildPageModel(
          title: 'Crie grupos facilmente',
          body: 'Gerencie as tarefas de um grupo com praticidade.',
          imagePath: 'assets/images/daily-tasks.png',
        ),
        _buildPageModel(
          title: 'Evite conflitos',
          body: 'Deixe o app dividir as tarefas de forma divertida.',
          imagePath: 'assets/images/repeat.png',
        ),
      ],
      onDone: () async => await onboardingViewModel.completeOnboarding(),
      onSkip: () async => await onboardingViewModel.completeOnboarding(),
      showSkipButton: true,
      skip: const Text('Skip', style: TextStyle(color: Colors.red)),
      next: const Icon(Icons.arrow_forward),
      done: const Text(
        'Finalizar',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).colorScheme.secondary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }

  PageViewModel _buildPageModel({
    required String title,
    required String body,
    required String imagePath,
  }) {
    return PageViewModel(
      title: title,
      body: body,
      image: Center(child: Image.asset(imagePath, height: 200)),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 16),
        contentMargin: EdgeInsets.all(16),
      ),
    );
  }
}
