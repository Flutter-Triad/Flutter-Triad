import 'package:flutter_triad/core/resources/manager_strings.dart';

class FieldValidator {
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return ManagerStrings.invalidEmptyEmail;
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return ManagerStrings.invalidEmail;
    }
    return null;
  }

  String? validatePassword(String password) {
    if (!RegExp(r'.{8,}').hasMatch(password)) {
      return ManagerStrings.invalidPasswordLength;
    }
    return null;
  }

  String? confirmPassword(String password, String confirmedPassword) {
    if (password != confirmedPassword) {
      return ManagerStrings.passwordNotMatch;
    }
    return null;
  }

  String? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return ManagerStrings.invalidEmptyPhoneNumber;
    }
    if (phoneNumber.length > 9 && phoneNumber.length < 11) {
      return null;
    }
    return ManagerStrings.invalidPhoneNumber;
  }

  String? validateFullName(String fullName) {
    if (fullName.isEmpty) {
      return ManagerStrings.invalidEmptyFullName;
    }
    if (fullName.length < 3) {
      return ManagerStrings.invalidFullName;
    }
    return null;
  }
  String? validateCode(value) {
    if (value == null || value.trim().isEmpty) {
      return ManagerStrings.invalidEmptyCode;
    }
    return null;
  }
}
