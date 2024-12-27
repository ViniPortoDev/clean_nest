import 'package:clean_nest/modules/auth/src/ui/sign_in_page.dart';
import 'package:clean_nest/modules/auth/src/ui/sign_up_page.dart';
import 'package:clean_nest/modules/home/src/ui/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const SignInPage());
    r.child('/sign_up', child: (context) => const SignUpPage());
  }
}
