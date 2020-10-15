///Rename the class from `FormValidator` tom `JinFormValidator` with reduce the conflic class Name wihthin the project if there's a custom validator
class JinFormValidator {
  static String validateRequired(String value,
      {String message = "Please input required field"}) {
    if (value.trim().isEmpty) return message;
    return null;
  }

  static String validateRequiredField(String value, String field,
      {String message}) {
    if (value.trim().isEmpty) return message ?? "Please input your $field";
    return null;
  }

  static String validateUsername(String value, {String message}) {
    if (value.trim().isEmpty) return "Please a input your username";
    return RegExp(r"^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$").hasMatch(value)
        ? null
        : "Please input valid username";
  }

  static String validateNumber(
    String value,
    String field, {
    num min,
    num max,
    bool isInteger = false,
  }) {
    try {
      if (value.trim().isEmpty) return "Please input your $field";
      num number = num.parse(value);
      if (min != null && number <= min) {
        return "$field must be more than $min";
      }
      if (max != null && number > max) {
        return "$field must be smaller than $max";
      }
      if (!(number is int) && isInteger) {
        return "$field must be an interger";
      }
      return null;
    } catch (e) {
      return "Please input a valid number";
    }
  }

  static String validateEmail(String value) {
    if (value.trim().isEmpty) return "Please a input your email";
    return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)
        ? null
        : "Please input a valid email";
  }

  static String validatePassword(String value, {int length = 6}) {
    if (value.trim().isEmpty) return "Please input your password";
    if (value.trim().length < length)
      return "Password must be at least $length characters long";
    return null;
  }

  static String validatePhoneNumber(String value,
      {String countryCode = "+855"}) {
    if (value.trim().isEmpty) return "Please input your phone number";
    String pattern = r'(^(?:[+855])?[0-9]{8,17}$)';
    bool isValidate = RegExp(pattern).hasMatch(value.replaceAll(" ", ""));
    return isValidate ? null : "Please input a valid phone number";
  }
}
