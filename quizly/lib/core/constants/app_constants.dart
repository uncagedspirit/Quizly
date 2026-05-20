abstract class AppConstants {
  AppConstants._();

  static const int quizCodeLength = 6;
  static const String quizCodeCharset = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
  static const int maxQuizTitleLength = 80;
  static const int maxQuizDescriptionLength = 200;
  static const int maxQuestionTextLength = 300;
  static const int maxOptionCount = 4;
  static const int maxCodeGenerationRetries = 5;
  static const int leaderboardQueryLimit = 100;
  static const Duration challengeExpiry = Duration(days: 30);
  static const int minDisplayNameLength = 2;
  static const int maxDisplayNameLength = 30;
  static const int minPasswordLength = 8;
}
