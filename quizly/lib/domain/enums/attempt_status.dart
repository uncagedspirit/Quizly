enum AttemptStatus {
  inProgress,
  submitted,
  abandoned;

  String toJson() => name;
  factory AttemptStatus.fromJson(String json) => AttemptStatus.values.byName(json);
}
