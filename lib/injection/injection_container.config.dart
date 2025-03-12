// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../core/services/local_storage/local_storage.dart' as _i666;
import '../core/services/local_storage/shared_preference/shared_preferences_module.dart'
    as _i764;
import '../core/services/local_storage/shared_preference/shared_preferences_service.dart'
    as _i75;
import '../core/user/data/datasource/user_local_datasource.dart' as _i991;
import '../core/user/data/repositories/user_repository_impl.dart' as _i349;
import '../core/user/domain/repositories/user_repository.dart' as _i167;
import '../core/user/domain/usecases/clear_user.dart' as _i433;
import '../core/user/domain/usecases/get_current_user.dart' as _i323;
import '../core/user/domain/usecases/save_user.dart' as _i101;
import '../features/auth/src/data/datasources/auth_remote_datasource.dart'
    as _i160;
import '../features/auth/src/data/repositories/auth_repository_impl.dart'
    as _i80;
import '../features/auth/src/domain/repositories/auth_repository.dart'
    as _i1004;
import '../features/auth/src/domain/usecases/create_group.dart' as _i63;
import '../features/auth/src/domain/usecases/login.dart' as _i393;
import '../features/auth/src/domain/usecases/logout.dart' as _i69;
import '../features/auth/src/domain/usecases/register_user.dart' as _i992;
import '../features/auth/src/domain/usecases/select_mascot.dart' as _i943;
import '../features/auth/src/ui/viewmodels/auth_viewmodel.dart' as _i773;
import '../features/auth/src/ui/viewmodels/profile_viewmodel.dart' as _i5;
import '../features/home/src/ui/viewmodels/home_viewmodel.dart' as _i598;
import '../features/home/src/ui/viewmodels/task_viewmodel.dart' as _i591;
import '../features/onboarding/ui/viewmodels/onboarding_viewmodel.dart'
    as _i972;
import '../features/splash/src/ui/viewmodel/splash_view_model.dart' as _i919;
import '../features/splash/src/usecases/delay_splash_use_case.dart' as _i627;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.factory<_i919.SplashViewModel>(() => _i919.SplashViewModel(
          delaySplashUseCase: gh<_i627.DelaySplashUseCase>(),
          localStorage: gh<_i666.LocalStorage>(),
        ));
    gh.factory<_i598.HomeViewmodel>(() => _i598.HomeViewmodel());
    gh.factory<_i591.TaskViewModel>(() => _i591.TaskViewModel());
    gh.factory<_i627.DelaySplashUseCase>(() => _i627.DelaySplashUseCase());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.factory<_i63.CreateGroupUsecase>(() => _i63.CreateGroup(
          gh<_i101.SaveUser>(),
          gh<_i323.GetCurrentUser>(),
        ));
    gh.lazySingleton<_i160.AuthRemoteDatasource>(
        () => _i160.AuthRemoteDatasourceImpl());
    gh.factory<_i943.SelectMascotUsecase>(() => _i943.SelectMascot());
    gh.lazySingleton<_i1004.AuthRepository>(() => _i80.AuthRepositoryImpl(
        remoteDatasource: gh<_i160.AuthRemoteDatasource>()));
    gh.lazySingleton<_i666.LocalStorage>(
        () => _i75.SharedPreferencesService(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i991.UserLocalDatasource>(() =>
        _i991.UserLocalDatasourceImpl(localStorage: gh<_i666.LocalStorage>()));
    gh.factory<_i972.OnboardingViewModel>(() =>
        _i972.OnboardingViewModel(localStorage: gh<_i666.LocalStorage>()));
    gh.factory<_i5.ProfileViewModel>(() => _i5.ProfileViewModel(
          gh<_i323.GetCurrentUser>(),
          gh<_i101.SaveUser>(),
        ));
    gh.lazySingleton<_i167.UserRepository>(() => _i349.UserRepositoryImpl(
        userLocalDataSource: gh<_i991.UserLocalDatasource>()));
    gh.factory<_i992.RegisterUserUseCase>(() => _i992.RegisterUser(
          gh<_i1004.AuthRepository>(),
          gh<_i101.SaveUser>(),
        ));
    gh.factory<_i101.SaveUserUseCase>(
        () => _i101.SaveUser(gh<_i167.UserRepository>()));
    gh.factory<_i323.GetCurrentUserUseCase>(
        () => _i323.GetCurrentUser(gh<_i167.UserRepository>()));
    gh.factory<_i433.ClearUserUseCase>(
        () => _i433.ClearUser(gh<_i167.UserRepository>()));
    gh.factory<_i393.LoginUseCase>(() => _i393.Login(
          gh<_i1004.AuthRepository>(),
          gh<_i101.SaveUserUseCase>(),
        ));
    gh.factory<_i773.AuthViewmodel>(
        () => _i773.AuthViewmodel(gh<_i992.RegisterUserUseCase>()));
    gh.factory<_i69.LogoutUsecase>(() => _i69.Logout(
          gh<_i1004.AuthRepository>(),
          gh<_i433.ClearUserUseCase>(),
        ));
    return this;
  }
}

class _$SharedPreferencesModule extends _i764.SharedPreferencesModule {}
