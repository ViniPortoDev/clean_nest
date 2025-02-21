import 'package:clean_nest/core/core_module.dart';
import 'package:clean_nest/modules/auth/src/data/datasources/auth_local_datasource.dart';
import 'package:clean_nest/modules/auth/src/data/datasources/auth_remote_datasource.dart';
import 'package:clean_nest/modules/auth/src/data/repositories/auth_repository_impl.dart';
import 'package:clean_nest/modules/auth/src/data/repositories/group_repository_impl.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/choose_mascot_repository.dart';
import 'package:clean_nest/modules/auth/src/data/repositories/choose_mascot_repository_impl.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/group_repository.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/register_user.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/get_current_user.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/update_user.dart';
import 'package:clean_nest/modules/auth/src/ui/pages/setup_profile_page.dart';
import 'package:clean_nest/modules/auth/src/ui/pages/create_rotine_group_page.dart';
import 'package:clean_nest/modules/auth/src/ui/pages/sign_in_page.dart';
import 'package:clean_nest/modules/auth/src/ui/pages/sign_up_page.dart';
import 'package:clean_nest/modules/auth/src/ui/viewmodels/auth_viewmodel.dart';
import 'package:clean_nest/modules/auth/src/ui/viewmodels/setup_profile_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    //Viewmodels
    i.addSingleton(SetupProfileViewModel.new);
    i.addSingleton(AuthViewmodel.new);

    //datasources
    i.addSingleton<AuthLocalDatasource>(AuthLocalDatasourceImpl.new);
    i.addSingleton<AuthRemoteDatasource>(AuthRemoteDatasourceImpl.new);

    //Repositories
    i.addSingleton<AuthRepository>(AuthRepositoryImpl.new);
    i.addSingleton<GroupRepository>(GroupRepositoryImpl.new);
    i.addSingleton<ChooseMascotRepository>(ChooseMascotRepositoryImpl.new);

    //Usecases
    i.addLazySingleton<CreateUserUsecase>(CreateUser.new);
    i.addLazySingleton<GetCurrentUserUsecase>(GetCurrentUser.new);
    i.addLazySingleton<UpdateUserUsecase>(UpdateUser.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SignInPage());
    r.child('/sign_up',
        child: (context) => SignUpPage(
              authViewmodel: context.read(),
            ));
    r.child(
      '/setup_profile',
      child: (context) => SetupProfilePage(
        setupProfileViewModel: context.read()..loadMascots(),
      ),
    );
    r.child('/create_rotine_group',
        child: (context) => const CreateRotineGroupPage());
  }
}
