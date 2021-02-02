import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'jin_utils.dart';

extension DateUtils on DateTime {
  String formatDate([String format = "dd MMM yyyy", Locale locale]) {
    String localeCode;
    if (locale != null) {
      localeCode = locale.languageCode;
    }
    var formatter = DateFormat(format, localeCode);
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

  String formatToLocalDate([String format = "dd MMM yyyy", Locale locale]) {
    String localeCode;
    if (locale != null) {
      localeCode = locale.languageCode;
    }
    var formatter = DateFormat(format, localeCode);
    return formatter.format(this.toLocal());
  }
}

extension StringExtension on String {
  String capitalize() {
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

  ///add padding all to a widget
  Widget paddingValue({
    double all,
    double vertical,
    double horizontal,
  }) {
    if (all != null && (vertical != null || horizontal != null)) {
      throw FlutterError(
        "paddingValue Error: Can't provide both all and horizontal or vertical at the same time",
      );
    }
    EdgeInsets padding;
    if (horizontal != null || vertical != null) {
      padding = EdgeInsets.symmetric(
        vertical: vertical ?? 0.0,
        horizontal: horizontal ?? 0.0,
      );
    } else {
      padding = EdgeInsets.all(all ?? 0.0);
    }

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

  Widget marginValue({
    double all,
    double vertical,
    double horizontal,
  }) {
    if (all != null && (vertical != null || horizontal != null)) {
      throw FlutterError(
        "marginValue Error: Can't provide both all and horizontal or vertical at the same time",
      );
    }
    EdgeInsets margin;
    if (horizontal != null || vertical != null) {
      margin = EdgeInsets.symmetric(
        vertical: vertical ?? 0.0,
        horizontal: horizontal ?? 0.0,
      );
    } else {
      margin = EdgeInsets.all(all ?? 0.0);
    }

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
          definePadding = EdgeInsets.all(padding.elementAt(0));
          break;
        case 2:
          definePadding = EdgeInsets.symmetric(
              vertical: padding.elementAt(0), horizontal: padding.elementAt(1));
          break;

        case 3:
          definePadding = EdgeInsets.only(
              top: padding.elementAt(0),
              right: padding.elementAt(1),
              bottom: padding.elementAt(2));
          break;

        default:
          definePadding = EdgeInsets.only(
              top: padding.elementAt(0),
              right: padding.elementAt(1),
              bottom: padding.elementAt(2),
              left: padding.elementAt(3));
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
      angle: JinUtils.degreeToRadian(degree),
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

  Widget applyStyle({
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 14,
  }) {
    if (this is Text) {
      return DefaultTextStyle.merge(
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

extension ContextExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get accentColor => Theme.of(this).accentColor;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
}

extension DurationExtension on Duration {
  String formatDuration({
    bool hasHour = true,
    bool hasMillisecond = false,
  }) {
    //if the digit is single digit, add 0 in front of it
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    //
    String twoDigitMinutes = twoDigits(this.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(this.inSeconds.remainder(60));
    String twoDigitMillisecond = twoDigits(this.inMilliseconds.remainder(1000));

    if (hasMillisecond) {
      return "$twoDigitMinutes:$twoDigitSeconds:$twoDigitMillisecond";
    } else if (hasHour) {
      return "${twoDigits(this.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
  }
}
