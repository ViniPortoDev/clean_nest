import 'package:clean_nest/modules/auth/src/data/datasources/auth_remote_datasource.dart';
import 'package:clean_nest/modules/auth/src/data/repositories/auth_repository_impl.dart';
import 'package:clean_nest/modules/auth/src/domain/repositories/auth_repository.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/login.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/logout.dart';
import 'package:clean_nest/modules/auth/src/domain/usecases/register_user.dart';
import 'package:clean_nest/modules/auth/src/ui/pages/profile_page.dart';
import 'package:clean_nest/modules/auth/src/ui/pages/create_rotine_group_page.dart';
import 'package:clean_nest/modules/auth/src/ui/pages/sign_in_page.dart';
import 'package:clean_nest/modules/auth/src/ui/pages/sign_up_page.dart';
import 'package:clean_nest/modules/auth/src/ui/viewmodels/auth_viewmodel.dart';
import 'package:clean_nest/modules/auth/src/ui/viewmodels/profile_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    //datasources
    i.addSingleton<AuthRemoteDatasource>(AuthRemoteDatasourceImpl.new);

    //Repositories
    i.addSingleton<AuthRepository>(AuthRepositoryImpl.new);

    //UseCases
    i.add<RegisterUserUseCase>(RegisterUser.new);
    i.add<LoginUseCase>(Login.new);
    i.add<LogoutUsecase>(Logout.new);

    //Viewmodels
    i.addSingleton(ProfileViewModel.new);
    i.addSingleton(AuthViewmodel.new);
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
      child: (context) => ProfilePage(
        profileViewModel: context.read()..fetchMascots(),
      ),
    );
    r.child('/create_rotine_group',
        child: (context) => const CreateRotineGroupPage());
  }
}
