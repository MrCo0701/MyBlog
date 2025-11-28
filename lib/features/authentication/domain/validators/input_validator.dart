class InputValidator {

  static String? validateFullName(String value) {
    if (value.isEmpty) return 'Full name is Empty';
    return null;
  }

  static String? validateEmail(String value) {
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Email invalid';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.length < 6) return 'Password must be more than 5 characters';
    return null;
  }

  static String? validateConfirmPassword(String p1, String p2) {
    if (p1 != p2) return 'passwords do not match';
    return null;
  }
}
