class PasswordsHelper {
  /**
   * Password requirements
   * - Contains 8 characters
   * - Contains at least one digit
   * - Contains at least one uppercase
   */
  static const minimumLength = 8;

  bool hasMinimumLength(String password) {
    return password.length >= minimumLength;
  }

  bool hasOneUpperCase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  bool hasDigits(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

  bool isValidPassword(String password) {
    return hasMinimumLength(password) &&
        hasOneUpperCase(password) &&
        hasDigits(password);
  }
}
