class MyValidation {
  String? nameValidate(String? input) {
    if ((input?.length ?? 0) > 2) {
      return null;
    }
    return 'Invalid name';
  }

  String? emailValidate(String? input) {
    if ((input?.length ?? 0) > 4 && input!.endsWith('@gmail.com')) {
      return null;
    }
    return 'Invalid email';
  }

  String? passwordValidate(String? input) {
    if ((input?.length ?? 0) > 7 && _containsDigits(input)) {
      return null;
    }
    return 'Password must be at least 8 characters long and contain digits';
  }

  String? verificationValidate(String? input) {
    if (input != null && input.length == 5 && _containsDigits(input)) {
      return null;
    }
    return 'Verification code must be exactly 5 digits long and contain only numbers';
  }

  String? passwordConfirmValidate(String? input) {
    if ((input?.length ?? 0) > 7 && _containsDigits(input)) {
      return null;
    }
    return 'Password must be at least 8 characters long and contain digits';
  }

  bool _containsDigits(String? input) {
    return input != null && input.contains(RegExp(r'\d'));
  }
}
