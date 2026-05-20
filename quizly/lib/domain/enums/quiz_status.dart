enum QuizStatus {
  live,
  closed,
  draft,
  deleted;

  String toJson() => name;
  factory QuizStatus.fromJson(String json) => QuizStatus.values.byName(json);
}
