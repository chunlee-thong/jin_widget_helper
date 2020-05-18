import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jin_widget_helper/src/utility.dart';

extension DateUtils on DateTime {
  String formatDate([String format = "dd MMM yyyy"]) {
    var formatter = DateFormat(format);
    return formatter.format(this);
  }

  bool isTheSameDay(DateTime dateTime) {
    if (dateTime.day == this.day &&
        dateTime.month == this.month &&
        dateTime.year == this.year) {
      return true;
    }
    return false;
  }

  String formatToLocalDate([String format = "dd MMM yyyy"]) {
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
  Widget padding([EdgeInsets padding = const EdgeInsets.all(8)]) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget margin([EdgeInsets margin = const EdgeInsets.all(8)]) {
    return Container(
      margin: margin,
      child: this,
    );
  }

  Widget cssSpacing({
    List<double> margin = const [],
    List<double> padding = const [],
  }) {
    EdgeInsets defineMargin = EdgeInsets.zero;
    EdgeInsets definePadding = EdgeInsets.zero;

    if (margin.isNotEmpty)
      switch (margin.length) {
        case 1:
          defineMargin = EdgeInsets.all(margin.elementAt(0));
          break;
        case 2:
          defineMargin = EdgeInsets.symmetric(
              vertical: margin.elementAt(0), horizontal: margin.elementAt(1));
          break;

        case 3:
          defineMargin = EdgeInsets.only(
              top: margin.elementAt(0),
              right: margin.elementAt(1),
              bottom: margin.elementAt(2));
          break;

        default:
          defineMargin = EdgeInsets.only(
              top: margin.elementAt(0),
              right: margin.elementAt(1),
              bottom: margin.elementAt(2),
              left: margin.elementAt(3));
          break;
      }

    if (padding.isNotEmpty)
      switch (padding.length) {
        case 1:
          definePadding = EdgeInsets.all(margin.elementAt(0));
          break;
        case 2:
          definePadding = EdgeInsets.symmetric(
              vertical: margin.elementAt(0), horizontal: margin.elementAt(1));
          break;

        case 3:
          defineMargin = EdgeInsets.only(
              top: margin.elementAt(0),
              right: margin.elementAt(1),
              bottom: margin.elementAt(2));
          break;

        default:
          definePadding = EdgeInsets.only(
              top: margin.elementAt(0),
              right: margin.elementAt(1),
              bottom: margin.elementAt(2),
              left: margin.elementAt(3));
          break;
      }

    return Container(
      padding: definePadding,
      margin: defineMargin,
      child: this,
    );
  }

  Widget rotate([double degree = 0]) {
    return Transform.rotate(
      angle: degreeToRadian(degree),
      child: this,
    );
  }

  Widget opacity([double opacity = 1]) {
    return Opacity(
      opacity: opacity,
      child: this,
    );
  }

  Widget textColor([Color color = Colors.white]) {
    if (this is Text) {
      return DefaultTextStyle.merge(
        style: TextStyle(color: color),
        child: this,
      );
    }
    return this;
  }

  Widget style({
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 14,
  }) {
    if (this is Text) {
      return DefaultTextStyle(
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
        child: this,
      );
    }
    return this;
  }

  Widget get expanded => Expanded(child: this);

  Widget get flexible => Flexible(child: this);

  Widget get ovalClip => ClipOval(child: this);
}

extension TextStyleExtension on TextStyle {
  //method
  TextStyle get bold => this.copyWith(fontWeight: FontWeight.bold);

  TextStyle get medium => this.copyWith(fontWeight: FontWeight.w500);

  TextStyle get normal => this.copyWith(fontWeight: FontWeight.normal);

  TextStyle applyColor(Color color) {
    return this.copyWith(color: color);
  }

  TextStyle applyFontSize(double size) {
    return this.copyWith(fontSize: size);
  }
}
