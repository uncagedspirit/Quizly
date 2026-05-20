import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../presentation/shared/controllers/auth_controller.dart';
import '../../presentation/shared/controllers/theme_controller.dart';
import '../../presentation/auth/screens/splash_screen.dart';
import '../../presentation/auth/screens/login_screen.dart';
import '../../presentation/auth/screens/signup_screen.dart';
import '../../presentation/home/screens/home_screen.dart';
import '../../presentation/create_quiz/screens/create_quiz_screen.dart';
import '../../presentation/create_quiz/screens/add_question_screen.dart';
import '../../presentation/create_quiz/screens/quiz_published_screen.dart';
import '../../presentation/creator_dashboard/screens/quiz_detail_screen.dart';
import '../../presentation/leaderboard/screens/leaderboard_screen.dart';
import '../../presentation/attempt/screens/attempt_intro_screen.dart';
import '../../presentation/attempt/screens/attempt_question_screen.dart';
import '../../presentation/attempt/screens/attempt_result_screen.dart';
import '../../presentation/challenge/screens/challenge_intro_screen.dart';
import 'route_names.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final authState = ref.watch(authStateChangesProvider);

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
        builder: (_, __) => const CreateQuizScreen(),
      ),
      GoRoute(
        path: '/quiz/create/question',
        builder: (_, __) => const AddQuestionScreen(),
      ),
      GoRoute(
        path: '/quiz/published/:quizId',
        builder: (_, state) => QuizPublishedScreen(
          quizId: state.pathParameters['quizId'] ?? '',
        ),
      ),
      GoRoute(
        path: '/quiz/:quizId',
        builder: (_, state) => QuizDetailScreen(
          quizId: state.pathParameters['quizId'] ?? '',
        ),
      ),
      GoRoute(
        path: '/quiz/:quizId/leaderboard',
        builder: (_, state) => LeaderboardScreen(
          quizId: state.pathParameters['quizId'] ?? '',
        ),
      ),
      GoRoute(
        path: '/attempt/intro/:code',
        builder: (_, state) => AttemptIntroScreen(
          code: state.pathParameters['code'] ?? '',
        ),
      ),
      GoRoute(
        path: '/attempt/quiz/:attemptId',
        builder: (_, state) => AttemptQuestionScreen(
          attemptId: state.pathParameters['attemptId'] ?? '',
        ),
      ),
      GoRoute(
        path: '/attempt/result/:attemptId',
        builder: (_, state) => AttemptResultScreen(
          attemptId: state.pathParameters['attemptId'] ?? '',
        ),
      ),
      GoRoute(
        path: '/challenge/:challengeId',
        builder: (_, state) => ChallengeIntroScreen(
          challengeId: state.pathParameters['challengeId'] ?? '',
        ),
      ),
    ],
  );
}
