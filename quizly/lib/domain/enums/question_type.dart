enum QuestionType {
  mcq,
  trueFalse;

  String toJson() => name;
  factory QuestionType.fromJson(String json) => QuestionType.values.byName(json);
}
