/// Validation utilities
class Validators {
  Validators._();

  /// Email validation regex pattern
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  /// Validate email format
  static bool isValidEmail(String email) {
    return _emailRegex.hasMatch(email);
  }

  /// Validate password (minimum 8 characters)
  static bool isValidPassword(String password) {
    return password.length >= 8;
  }

  /// Validate password length (8-16 characters)
  static bool isValidPasswordLength(String password) {
    return password.length >= 8 && password.length <= 16;
  }
}
