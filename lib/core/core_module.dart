import 'package:clean_nest/core/data/repositories/shared_preferences_repository_impl.dart';
import 'package:clean_nest/core/data/repositories/user_repository_impl.dart';
import 'package:clean_nest/core/domain/repositories/local_storage_repository.dart';
import 'package:clean_nest/core/domain/repositories/user_repository.dart';
import 'package:clean_nest/core/utils/shared_pref.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance<SharedPreferences>(SharedPref.instance);
    i.addLazySingleton(SharedPreferencesRepositoryImpl.new);
    i.addLazySingleton<UserRepository>(UserRepositoryImpl.new);
  }
}
