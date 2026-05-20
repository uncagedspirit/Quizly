class Validators {
  Validators._();

  static String? displayName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Name is required';
    if (value.trim().length < 2) return 'Name must be at least 2 characters';
    if (value.trim().length > 30) return 'Name must be under 30 characters';
    if (!RegExp(r"^[a-zA-Z\s'.]+$").hasMatch(value.trim())) {
      return 'Name can only contain letters, spaces, apostrophes, and periods';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value.trim())) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    return null;
  }

  static String? quizTitle(String? value) {
    if (value == null || value.trim().isEmpty) return 'Title is required';
    if (value.trim().length > 80) return 'Title must be under 80 characters';
    return null;
  }

  static String? questionText(String? value) {
    if (value == null || value.trim().isEmpty) return 'Question text is required';
    if (value.trim().length > 300) return 'Question must be under 300 characters';
    return null;
  }
}
