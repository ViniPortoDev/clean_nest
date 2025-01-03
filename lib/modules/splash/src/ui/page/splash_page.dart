// presentation/splash/splash_page.dart
import 'package:clean_nest/modules/splash/src/ui/viewmodel/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  final SplashViewModel splashViewModel;
  const SplashPage({super.key, required this.splashViewModel});

  @override
  State<SplashPage> createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    widget.splashViewModel.startSplash();
  }
  @override
  Widget build(BuildContext context) {


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
