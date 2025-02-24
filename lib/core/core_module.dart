import 'package:clean_nest/core/services/local_storage/local_storage.dart';
import 'package:clean_nest/core/services/local_storage/shared_preference/shared_preferences_service.dart';
import 'package:clean_nest/core/user/user_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    // 
    i.addSingleton<LocalStorage>(SharedPreferencesService.new);
  }

  @override
  List<Module> get imports => [
        UserModule(),
      ];
}
