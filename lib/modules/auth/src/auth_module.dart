import 'package:clean_nest/modules/auth/src/domain/repositories/choose_mascot_repository.dart';
import 'package:clean_nest/modules/auth/src/data/repositories/choose_mascot_repository_impl.dart';
import 'package:clean_nest/modules/auth/src/ui/pages/choose_mascot_page.dart';
import 'package:clean_nest/modules/auth/src/ui/pages/create_rotine_group_page.dart';
import 'package:clean_nest/modules/auth/src/ui/pages/sign_in_page.dart';
import 'package:clean_nest/modules/auth/src/ui/pages/sign_up_page.dart';
import 'package:clean_nest/modules/auth/src/ui/viewmodels/choose_mascot_viewmodel.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<ChooseMascotRepository>(ChooseMascotRepositoryImpl.new);
    // i.addSingleton(GetMascotUseCase.new);
    i.addSingleton(ChooseMascotViewModel.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SignInPage());
    r.child('/sign_up', child: (context) => const SignUpPage());
    r.child(
      '/choose_mascot',
      child: (context) => ChooseMascotPage(
        chooseMascotViewModel: context.read()..loadMascots(),
      ),
    );
    r.child('/create_rotine_group',
        child: (context) => const CreateRotineGroupPage());
  }
}
