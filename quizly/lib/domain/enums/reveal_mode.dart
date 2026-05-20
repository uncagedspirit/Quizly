enum RevealMode {
  afterEach,
  atEnd,
  none;

  String toJson() => name;
  factory RevealMode.fromJson(String json) => RevealMode.values.byName(json);
}
