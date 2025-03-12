import 'package:clean_nest/features/auth/src/ui/viewmodels/auth_viewmodel.dart';
import 'package:clean_nest/features/auth/src/ui/viewmodels/profile_viewmodel.dart';
import 'package:clean_nest/injection/injection_container.dart';
import 'package:go_router/go_router.dart';
import 'package:clean_nest/features/auth/src/ui/pages/sign_in_page.dart';
import 'package:clean_nest/features/auth/src/ui/pages/sign_up_page.dart';
import 'package:clean_nest/features/auth/src/ui/pages/profile_page.dart';
import 'package:clean_nest/features/auth/src/ui/pages/create_rotine_group_page.dart';

final authRoutes = [
  GoRoute(
    path: 'sign_in', 
    builder: (context, state) => const SignInPage(),
  ),
  GoRoute(
    path: 'sign_up', 
    builder: (context, state) => SignUpPage(
      authViewmodel: getIt.get<AuthViewmodel>(),
    ),
  ),
  GoRoute(
    path: 'setup_profile', 
    builder: (context, state) => ProfilePage(
      profileViewModel: getIt.get<ProfileViewModel>(),
    ),
  ),
  GoRoute(
    path: 'create_rotine_group', 
    builder: (context, state) => const CreateRotineGroupPage(),
  ),
];
