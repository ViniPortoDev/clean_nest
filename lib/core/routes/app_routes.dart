import 'package:clean_nest/core/routes/auth_routes.dart';
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
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: SplashPage(
          splashViewModel: getIt.get<SplashViewModel>(),
        ),
      ),
    ),

    // Onboarding
    GoRoute(
      path: '/onboarding',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: OnboardingPage(
          onboardingViewModel: getIt.get<OnboardingViewModel>(),
        ),
      ),
    ),

    // Auth
    GoRoute(
      path: '/auth',
      redirect: (context, state) => '/auth/sign_up',
      routes: authRoutes,
    ),

    // Home
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: HomePage(
          taskViewModel: getIt.get<TaskViewModel>(),
          homeViewmodel: getIt.get<HomeViewmodel>(),
        ),
      ),
    ),
  ],
);
