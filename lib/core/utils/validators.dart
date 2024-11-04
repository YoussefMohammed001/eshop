class Validators {
  static bool isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z]\w*([_.-]\w*)?@[a-zA-Z\d]+([.-][a-zA-Z\d]+)*\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }

  // Function to validate Saudi Arabian phone numbers
  static bool validateSaudiPhone(String value) {
    // Check if the phone number matches the Saudi format
    return RegExp(r'^(?:\+966|05)[0-9]{8}$').hasMatch(value);
  }

  static bool isNotValidEmail(String email) => !isValidEmail(email);

  static bool isValidPassword(String password) {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9].*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password);
  }

  static bool isNotValidPassword(String password) => !isValidPassword(password);

  static bool isNotValidPhone(String phone) {
    return RegExp("(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9].*[0-9])(?=.*[^a-zA-Z0-9]).{8,}")
        .hasMatch(phone);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  // Password confirmation validator
  static bool isPasswordConfirmed(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  // Validator for Saudi ID number
  static bool isValidSaudiId(String idNumber) {
    // Check if the ID number is numeric and has exactly 10 digits
    return RegExp(r'^\d{10}$').hasMatch(idNumber);
  }

  static bool isNotValidSaudiId(String idNumber) => !isValidSaudiId(idNumber);
}