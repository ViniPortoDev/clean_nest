import 'package:clean_nest/core/services/local_storage/local_storage.dart';
import 'package:clean_nest/core/services/local_storage/shared_preference/shared_preferences_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageModule extends Module {
  final SharedPreferences prefs;

  LocalStorageModule({required this.prefs});

  @override
  void exportedBinds(i) {
    
    i.addInstance<LocalStorage>(SharedPreferencesService(prefs: prefs));
  }
}
