import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/shared/controllers/auth_controller.dart';
import '../../presentation/shared/controllers/theme_controller.dart';
import '../../presentation/shared/controllers/connectivity_controller.dart';
import '../../presentation/auth/screens/splash_screen.dart';
import '../../presentation/auth/screens/login_screen.dart';
import '../../presentation/auth/screens/signup_screen.dart';
import '../../presentation/home/screens/home_screen.dart';
import '../../core/theme/app_theme.dart';
import 'route_names.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final authState = ref.watch(authStateChangesProvider);
  final themeMode = ref.watch(themeControllerProvider);

  return GoRouter(
    initialLocation: RouteNames.splash,
    redirect: (context, state) {
      final isAuth = authState.valueOrNull;
      final location = state.uri.path;

      if (isAuth is AuthAuthenticated) {
        if (location == RouteNames.login || location == RouteNames.signup) {
          return RouteNames.home;
        }
      }

      if (isAuth is AuthGuest) {
        if (location == RouteNames.createQuiz) {
          return RouteNames.login;
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.onboarding,
        builder: (_, __) => const PlaceholderScreen(title: 'Onboarding'),
      ),
      GoRoute(
        path: RouteNames.login,
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.signup,
        builder: (_, __) => const SignupScreen(),
      ),
      GoRoute(
        path: RouteNames.home,
        builder: (_, __) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteNames.createQuiz,
        builder: (_, __) => const PlaceholderScreen(title: 'Create Quiz'),
      ),
      GoRoute(
        path: '/quiz/create/question',
        builder: (_, __) => const PlaceholderScreen(title: 'Add Question'),
      ),
      GoRoute(
        path: '/quiz/published/:quizId',
        builder: (_, state) => PlaceholderScreen(
          title: 'Quiz Published: ${state.pathParameters['quizId']}',
        ),
      ),
      GoRoute(
        path: '/quiz/:quizId',
        builder: (_, state) => PlaceholderScreen(
          title: 'Quiz Detail: ${state.pathParameters['quizId']}',
        ),
      ),
      GoRoute(
        path: '/quiz/:quizId/leaderboard',
        builder: (_, state) => PlaceholderScreen(
          title: 'Leaderboard: ${state.pathParameters['quizId']}',
        ),
      ),
      GoRoute(
        path: '/attempt/intro/:code',
        builder: (_, state) => PlaceholderScreen(
          title: 'Attempt: ${state.pathParameters['code']}',
        ),
      ),
      GoRoute(
        path: '/attempt/quiz/:attemptId',
        builder: (_, state) => PlaceholderScreen(
          title: 'Question: ${state.pathParameters['attemptId']}',
        ),
      ),
      GoRoute(
        path: '/attempt/result/:attemptId',
        builder: (_, state) => PlaceholderScreen(
          title: 'Result: ${state.pathParameters['attemptId']}',
        ),
      ),
      GoRoute(
        path: '/challenge/:challengeId',
        builder: (_, state) => PlaceholderScreen(
          title: 'Challenge: ${state.pathParameters['challengeId']}',
        ),
      ),
    ],
  );
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(child: Text('Coming soon')),
    );
  }
}
