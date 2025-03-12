import 'package:clean_nest/core/routes/app_routes.dart';
import 'package:clean_nest/core/themes/themes.dart';
import 'package:clean_nest/injection/injection_container.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    const AppWidget(),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Clean Nest",
      theme: CnThemes().lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
