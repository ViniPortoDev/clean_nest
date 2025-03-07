import 'package:clean_nest/core/services/local_storage/local_storage.dart';
import 'package:clean_nest/core/services/local_storage/shared_preference/shared_preferences_service.dart';
import 'package:clean_nest/core/user/data/datasource/user_local_datasource.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/clear_user.dart';
import 'domain/usecases/get_current_user.dart';
import 'domain/usecases/save_user.dart';
import 'domain/repositories/user_repository.dart';
import 'data/repositories/user_repository_impl.dart';

class UserModule extends Module {
  @override
  void exportedBinds(Injector i) {
    // LocalStorage
    i.add<LocalStorage>(SharedPreferencesService.new);

    // Usecases
    i.add<ClearUserUseCase>(ClearUser.new);
    i.add<GetCurrentUserUseCase>(GetCurrentUser.new);
    i.add<SaveUserUseCase>(SaveUser.new);

    // Datasource
    i.add<UserLocalDatasource>(UserLocalDatasourceImpl.new);

    // Repository
    i.add<UserRepository>(UserRepositoryImpl.new);
  }
}
