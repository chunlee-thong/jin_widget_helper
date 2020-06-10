import 'package:flutter/material.dart';

///Rename the class from `FormValidator` tom `JinFormValidator` with reduce the conflic class Name wihthin the project if there's a custom validator
class JinFormValidator {
  static String validateSimpleField(String value, BuildContext context) {
    if (value.trim().isEmpty) return "Please input required field";
    return null;
  }

  static String validateField(
      String value, String field, BuildContext context) {
    if (value.trim().isEmpty) return "Please input $field";
    return null;
  }

  static String validateEmail(String value, BuildContext context) {
    if (value.trim().isEmpty) return "Please a input your email";
    return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)
        ? null
        : "Please input a valid email";
  }

  static String validatePassword(String value, BuildContext context,
      {int length = 6}) {
    if (value.trim().isEmpty) return "Please input your password";
    if (value.trim().length < length)
      return "Password must be at least $length characters long";
    return null;
  }

  static String validatePhoneNumber(String value, BuildContext context) {
    if (value.trim().isEmpty) return "Please input your phone number";
    return value.length > 6 && value.length < 17
        ? null
        : "Please input a valid phone number";
  }

  static String validateCountry(String value, BuildContext context) {
    if (value.trim().isEmpty) return "Please input your country";
    return null;
  }

  static String validateFirstName(String value, BuildContext context) {
    if (value.trim().isEmpty) return "Please input your first name";
    return null;
  }

  static String validateLastName(String value, BuildContext context) {
    if (value.trim().isEmpty) return "Please input your last name";
    return null;
  }

  static String validateNumber(
      String value, String field, BuildContext context) {
    if (value.trim().isEmpty) return "Please input your $field";
    if (int.parse(value) is int) {
      return null;
    }
    return "Please input a valid number";
  }
}
