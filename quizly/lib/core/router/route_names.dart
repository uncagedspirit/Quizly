abstract class RouteNames {
  RouteNames._();

  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/';
  static const createQuiz = '/quiz/create';
  static const addQuestion = '/quiz/create/question';
  static String quizPublished(String quizId) => '/quiz/published/$quizId';
  static String quizDetail(String quizId) => '/quiz/$quizId';
  static String leaderboard(String quizId) => '/quiz/$quizId/leaderboard';
  static String attemptIntro(String code) => '/attempt/intro/$code';
  static String attemptQuiz(String attemptId) => '/attempt/quiz/$attemptId';
  static String attemptResult(String attemptId) => '/attempt/result/$attemptId';
  static String challenge(String challengeId) => '/challenge/$challengeId';
}
