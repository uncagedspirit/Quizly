import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../presentation/shared/controllers/auth_controller.dart';
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
        pageBuilder: (_, __) => const NoTransitionPage(
          child: SplashScreen(),
        ),
      ),
      GoRoute(
        path: RouteNames.login,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
          transitionsBuilder: _fadeTransition,
          transitionDuration: const Duration(milliseconds: 250),
        ),
      ),
      GoRoute(
        path: RouteNames.signup,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SignupScreen(),
          transitionsBuilder: _slideTransition,
          transitionDuration: const Duration(milliseconds: 320),
        ),
      ),
      GoRoute(
        path: RouteNames.home,
        pageBuilder: (_, __) => const NoTransitionPage(
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: RouteNames.createQuiz,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const CreateQuizScreen(),
          transitionsBuilder: _slideTransition,
          transitionDuration: const Duration(milliseconds: 320),
        ),
      ),
      GoRoute(
        path: '/quiz/create/question',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AddQuestionScreen(),
          transitionsBuilder: _slideTransition,
          transitionDuration: const Duration(milliseconds: 320),
        ),
      ),
      GoRoute(
        path: '/quiz/published/:quizId',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: QuizPublishedScreen(
            quizId: state.pathParameters['quizId'] ?? '',
          ),
          transitionsBuilder: _fadeUpTransition,
          transitionDuration: const Duration(milliseconds: 280),
        ),
      ),
      GoRoute(
        path: '/quiz/:quizId',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: QuizDetailScreen(
            quizId: state.pathParameters['quizId'] ?? '',
          ),
          transitionsBuilder: _slideTransition,
          transitionDuration: const Duration(milliseconds: 320),
        ),
      ),
      GoRoute(
        path: '/quiz/:quizId/leaderboard',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: LeaderboardScreen(
            quizId: state.pathParameters['quizId'] ?? '',
          ),
          transitionsBuilder: _slideTransition,
          transitionDuration: const Duration(milliseconds: 320),
        ),
      ),
      GoRoute(
        path: '/attempt/intro/:code',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: AttemptIntroScreen(
            code: state.pathParameters['code'] ?? '',
          ),
          transitionsBuilder: _slideTransition,
          transitionDuration: const Duration(milliseconds: 320),
        ),
      ),
      GoRoute(
        path: '/attempt/quiz/:attemptId',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: AttemptQuestionScreen(
            attemptId: state.pathParameters['attemptId'] ?? '',
          ),
          transitionsBuilder: _slideTransition,
          transitionDuration: const Duration(milliseconds: 320),
        ),
      ),
      GoRoute(
        path: '/attempt/result/:attemptId',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: AttemptResultScreen(
            attemptId: state.pathParameters['attemptId'] ?? '',
          ),
          transitionsBuilder: _slideTransition,
          transitionDuration: const Duration(milliseconds: 320),
        ),
      ),
      GoRoute(
        path: '/challenge/:challengeId',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: ChallengeIntroScreen(
            challengeId: state.pathParameters['challengeId'] ?? '',
          ),
          transitionsBuilder: _fadeUpTransition,
          transitionDuration: const Duration(milliseconds: 280),
        ),
      ),
    ],
  );
}

Widget _slideTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child,) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animation,
      curve: const Cubic(0, 0, 0.2, 1),
    ),),
    child: child,
  );
}

Widget _fadeTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child,) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeIn,
    ),
    child: child,
  );
}

Widget _fadeUpTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child,) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),),
    child: FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}
