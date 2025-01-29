import 'package:clean_nest/core/themes/theme_spacings.dart';
import 'package:clean_nest/core/themes/theme_text_styles.dart';
import 'package:clean_nest/modules/onboarding/ui/viewmodels/onboarding_viewmodel.dart';
import 'package:clean_nest/shared/widgets/buttons/cn_primary_button_widget.dart';
import 'package:clean_nest/shared/widgets/buttons/cn_secundary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingViewModel onboardingViewModel;
  const OnboardingPage({super.key, required this.onboardingViewModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    theme.extension<CnTextStyles>();
    final themeSpacing = theme.extension<CnSpacing>();
    return IntroductionScreen(
      pages: [
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
        _buildPageModel(
          title: 'Organize suas tarefas',
          // body: 'Distribua as tarefas de forma justa e intuitiva.',
          bodyWidget: Column(
            children: [
              const Text('Faça login ou crie sua conta'),
              SizedBox(height: themeSpacing!.spacing32px),
              CnPrimaryButtonWidget(
                title: 'Criar conta',
                onPressed: () {
                  Modular.to.pushNamed('/auth/sign_up');
                },
                height: 70,
              ),
              SizedBox(height: themeSpacing.spacing24px),
              CnSecundaryButtonWidget(
                title: 'Login',
                onPressed: () {
                  Modular.to.pushNamed('/auth/');
                },
                height: 70,
              ),
            ],
          ),
          imagePath: 'assets/images/news.png',
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
        activeColor: Theme.of(context).colorScheme.primary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }

  PageViewModel _buildPageModel({
    required String title,
    String? body,
    Widget? bodyWidget,
    required String imagePath,
  }) {
    return PageViewModel(
      decoration: const PageDecoration(bodyPadding: EdgeInsets.all(16)),
      title: title,
      body: body,
      bodyWidget: bodyWidget,
      image: Image.asset(imagePath, height: 200),
    );
  }
}
