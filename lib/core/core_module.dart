import 'package:clean_nest/core/services/local_storage/shared_preference/shared_preferences_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance(SharedPreferencesService()..init());
    
  }
}
