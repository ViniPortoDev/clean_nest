// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_nest/core/services/local_storage/local_storage.dart'
    as _i1048;
import 'package:clean_nest/core/services/local_storage/shared_preference/shared_preferences_module.dart'
    as _i1061;
import 'package:clean_nest/core/services/local_storage/shared_preference/shared_preferences_service.dart'
    as _i521;
import 'package:clean_nest/core/user/data/datasource/user_local_datasource.dart'
    as _i412;
import 'package:clean_nest/core/user/data/repositories/user_repository_impl.dart'
    as _i603;
import 'package:clean_nest/core/user/domain/repositories/user_repository.dart'
    as _i954;
import 'package:clean_nest/core/user/domain/usecases/clear_user.dart' as _i566;
import 'package:clean_nest/core/user/domain/usecases/get_current_user.dart'
    as _i691;
import 'package:clean_nest/core/user/domain/usecases/save_user.dart' as _i661;
import 'package:clean_nest/features/auth/src/data/datasources/auth_remote_datasource.dart'
    as _i229;
import 'package:clean_nest/features/auth/src/data/repositories/auth_repository_impl.dart'
    as _i817;
import 'package:clean_nest/features/auth/src/domain/repositories/auth_repository.dart'
    as _i455;
import 'package:clean_nest/features/auth/src/domain/usecases/create_group.dart'
    as _i758;
import 'package:clean_nest/features/auth/src/domain/usecases/login.dart'
    as _i760;
import 'package:clean_nest/features/auth/src/domain/usecases/logout.dart'
    as _i544;
import 'package:clean_nest/features/auth/src/domain/usecases/register_user.dart'
    as _i500;
import 'package:clean_nest/features/auth/src/domain/usecases/select_mascot.dart'
    as _i19;
import 'package:clean_nest/features/auth/src/ui/bloc/auth_viewmodel.dart'
    as _i528;
import 'package:clean_nest/features/auth/src/ui/bloc/profile_viewmodel.dart'
    as _i1013;
import 'package:clean_nest/features/home/src/ui/viewmodels/home_viewmodel.dart'
    as _i848;
import 'package:clean_nest/features/home/src/ui/viewmodels/task_viewmodel.dart'
    as _i168;
import 'package:clean_nest/features/onboarding/ui/viewmodels/onboarding_viewmodel.dart'
    as _i757;
import 'package:clean_nest/features/splash/src/ui/viewmodel/splash_view_model.dart'
    as _i840;
import 'package:clean_nest/features/splash/src/usecases/delay_splash_use_case.dart'
    as _i478;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

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
    gh.factory<_i840.SplashViewModel>(() => _i840.SplashViewModel(
          delaySplashUseCase: gh<_i478.DelaySplashUseCase>(),
          localStorage: gh<_i1048.LocalStorage>(),
        ));
    gh.factory<_i848.HomeViewmodel>(() => _i848.HomeViewmodel());
    gh.factory<_i168.TaskViewModel>(() => _i168.TaskViewModel());
    gh.factory<_i478.DelaySplashUseCase>(() => _i478.DelaySplashUseCase());
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i229.AuthRemoteDatasource>(
        () => _i229.AuthRemoteDatasourceImpl());
    gh.factory<_i19.SelectMascotUsecase>(() => _i19.SelectMascot());
    gh.lazySingleton<_i455.AuthRepository>(() => _i817.AuthRepositoryImpl(
        remoteDatasource: gh<_i229.AuthRemoteDatasource>()));
    gh.lazySingleton<_i1048.LocalStorage>(
        () => _i521.SharedPreferencesService(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i412.UserLocalDatasource>(() =>
        _i412.UserLocalDatasourceImpl(localStorage: gh<_i1048.LocalStorage>()));
    gh.factory<_i757.OnboardingViewModel>(() =>
        _i757.OnboardingViewModel(localStorage: gh<_i1048.LocalStorage>()));
    gh.lazySingleton<_i954.UserRepository>(() => _i603.UserRepositoryImpl(
        userLocalDataSource: gh<_i412.UserLocalDatasource>()));
    gh.factory<_i661.SaveUserUseCase>(
        () => _i661.SaveUser(gh<_i954.UserRepository>()));
    gh.factory<_i691.GetCurrentUserUseCase>(
        () => _i691.GetCurrentUser(gh<_i954.UserRepository>()));
    gh.factory<_i566.ClearUserUseCase>(
        () => _i566.ClearUser(gh<_i954.UserRepository>()));
    gh.factory<_i760.LoginUseCase>(() => _i760.Login(
          gh<_i455.AuthRepository>(),
          gh<_i661.SaveUserUseCase>(),
        ));
    gh.factory<_i544.LogoutUsecase>(() => _i544.Logout(
          gh<_i455.AuthRepository>(),
          gh<_i566.ClearUserUseCase>(),
        ));
    gh.factory<_i1013.ProfileViewModel>(() => _i1013.ProfileViewModel(
          gh<_i691.GetCurrentUserUseCase>(),
          gh<_i661.SaveUserUseCase>(),
        ));
    gh.factory<_i758.CreateGroupUsecase>(() => _i758.CreateGroup(
          gh<_i661.SaveUserUseCase>(),
          gh<_i691.GetCurrentUserUseCase>(),
        ));
    gh.factory<_i500.RegisterUserUseCase>(() => _i500.RegisterUser(
          gh<_i455.AuthRepository>(),
          gh<_i661.SaveUserUseCase>(),
        ));
    gh.factory<_i528.AuthViewmodel>(
        () => _i528.AuthViewmodel(gh<_i500.RegisterUserUseCase>()));
    return this;
  }
}

class _$SharedPreferencesModule extends _i1061.SharedPreferencesModule {}
