enum AuthStatus {
  authenticated,
  guest,
  signedOut;

  String toJson() => name;
  factory AuthStatus.fromJson(String json) => AuthStatus.values.byName(json);
}
