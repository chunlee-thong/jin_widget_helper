///Rename the class from `FormValidator` tom `JinFormValidator` with reduce the conflic class Name wihthin the project if there's a custom validator
class JinFormValidator {
  static String validateField(
    String value,
    String field, {
    String message,
    int length,
  }) {
    if (value.trim().isEmpty) {
      if (field != null) return message ?? "Please input your $field";
    }
    if (length != null && value.length < length) {
      return "$field must be $length characters long";
    }
    return null;
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
        return "$field must be a number";
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
}
