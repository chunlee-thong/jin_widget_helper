import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jin_widget_helper/src/utility.dart';

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

extension WidgetExtension on Widget {
  Widget padding({EdgeInsets padding = const EdgeInsets.all(8)}) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget margin({EdgeInsets margin = const EdgeInsets.all(8)}) {
    return Container(
      margin: margin,
      child: this,
    );
  }

  Widget rotate({double degree = 0}) {
    return Transform.rotate(
      angle: degreeToRadian(degree),
      child: this,
    );
  }
}

extension TextStyleExtension on TextStyle {
  //method
  TextStyle get bold => this.copyWith(fontWeight: FontWeight.bold);

  TextStyle get medium => this.copyWith(fontWeight: FontWeight.w500);

  TextStyle applyColor(Color color) {
    return this.copyWith(color: color);
  }

  TextStyle applyFontSize(double size) {
    return this.copyWith(fontSize: size);
  }
}
