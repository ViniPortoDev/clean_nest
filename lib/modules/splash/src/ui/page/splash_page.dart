// presentation/splash/splash_page.dart
import 'package:clean_nest/modules/splash/src/ui/viewmodel/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Acesso direto ao ViewModel injetado pelo Modular
    final splashViewModel = Modular.get<SplashViewModel>();

    // Inicia a lógica do SplashScreen
    splashViewModel.startSplash();

    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ), // Exibe a imagem
      ),
    );
  }
}
