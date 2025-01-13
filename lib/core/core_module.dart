import 'package:clean_nest/core/data/repositories/shared_preferences_repository.dart';
import 'package:clean_nest/core/utils/shared_pref.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance<SharedPreferences>(SharedPref.instance);
    i.addSingleton(SharedPreferencesRepository.new);
  }
}
