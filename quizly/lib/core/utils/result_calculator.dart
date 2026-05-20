class ResultCalculator {
  ResultCalculator._();

  static int correctCount(List<bool> isCorrectList) {
    return isCorrectList.where((c) => c).length;
  }

  static int percentage(int correct, int total) {
    if (total == 0) return 0;
    return ((correct / total) * 100).round();
  }

  static int totalTimeMs(List<int> timeTakenMsList) {
    return timeTakenMsList.fold(0, (sum, t) => sum + t);
  }

  static int rank(int aboveCount) => aboveCount + 1;
}
