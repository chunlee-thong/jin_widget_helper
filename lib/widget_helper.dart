import 'package:flutter/material.dart';

class WidgetHelper {
  ///Create a sizedBox with set height
  static Widget verticalSpace([double height = 8]) {
    return SizedBox(height: height);
  }

  ///Create a sizedBox with set width
  static Widget horizontalSpace([double width = 8]) {
    return SizedBox(width: width);
  }
}
