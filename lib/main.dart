import 'package:clean_nest/app_module.dart';
import 'package:clean_nest/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child:  AppWidget(),
    ),
  );
}
