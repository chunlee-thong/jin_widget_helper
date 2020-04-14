import 'package:intl/intl.dart';

extension DateUtils on DateTime {
  String formatDate({String format = "dd MMM yyyy"}) {
    var formatter = DateFormat(format);
    return formatter.format(this);
  }

  bool isTheSameDay(DateTime dateTime) {
    if (dateTime.day == this.day &&
        dateTime.month == this.day &&
        dateTime.year == this.year) {
      return true;
    }
    return false;
  }

  String formatToLocalDate({String format = "dd MMM yyyy"}) {
    var formatter = DateFormat(format);
    return formatter.format(this.toLocal());
  }
}

extension StringExtension on String {
  String firstUpperCase() {
    return this[0].toUpperCase() + this.substring(1, this.length);
  }
}
