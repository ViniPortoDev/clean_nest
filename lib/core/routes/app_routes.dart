import 'package:clean_nest/core/routes/auth_routes.dart';
import 'package:clean_nest/features/auth/src/ui/pages/create_rotine_group_page.dart';
import 'package:clean_nest/features/auth/src/ui/pages/profile_page.dart';
import 'package:clean_nest/features/auth/src/ui/pages/sign_in_page.dart';
import 'package:clean_nest/features/auth/src/ui/pages/sign_up_page.dart';
import 'package:clean_nest/features/auth/src/ui/bloc/auth_viewmodel.dart';
import 'package:clean_nest/features/auth/src/ui/bloc/profile_viewmodel.dart';
import 'package:clean_nest/features/home/src/ui/viewmodels/home_viewmodel.dart';
import 'package:clean_nest/features/home/src/ui/viewmodels/task_viewmodel.dart';
import 'package:clean_nest/features/onboarding/ui/viewmodels/onboarding_viewmodel.dart';
import 'package:clean_nest/features/splash/src/ui/viewmodel/splash_view_model.dart';
import 'package:clean_nest/injection/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clean_nest/features/splash/src/ui/page/splash_page.dart';
import 'package:clean_nest/features/onboarding/ui/pages/onboarding_page.dart';
import 'package:clean_nest/features/home/src/ui/pages/home_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // Splash
    GoRoute(
      path: '/',
      builder: (context, state) => SplashPage(
        splashViewModel: getIt.get<SplashViewModel>(),
      ),
    ),

    // Onboarding
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => OnboardingPage(
        onboardingViewModel: getIt.get<OnboardingViewModel>(),
      ),
    ),

    // Auth
    GoRoute(
      path: '/auth',
      builder: (context, state) => SignUpPage(
        authViewmodel: getIt.get<AuthViewmodel>(),
      ),
      routes: [
        GoRoute(
          name: 'sign_in',
          path: 'sign_in',
          builder: (context, state) => const SignInPage(),
        ),
        GoRoute(
          name: 'setup_profile',
          path: 'setup_profile',
          builder: (context, state) => ProfilePage(
            profileViewModel: getIt.get<ProfileViewModel>(),
          ),
        ),
        GoRoute(
          name: 'create_rotine_group',
          path: 'create_rotine_group',
          builder: (context, state) => const CreateRotineGroupPage(),
        ),
      ],
    ),

    // Home
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(
        taskViewModel: getIt.get<TaskViewModel>(),
        homeViewmodel: getIt.get<HomeViewmodel>(),
      ),
    ),
  ],
);
