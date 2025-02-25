import 'package:clean_nest/app_module.dart';
import 'package:clean_nest/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ModularApp(
      module: AppModule(prefs: sharedPreferences),
      child: const AppWidget(),
    ),
  );
}
