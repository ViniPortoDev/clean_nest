import 'package:clean_nest/app_module.dart';
import 'package:clean_nest/app_widget.dart';
import 'package:clean_nest/core/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPref.init();

  runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}
