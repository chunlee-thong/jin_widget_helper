import 'package:flutter/material.dart';

class WidgetHelper {
  static Widget verticalSpace([double height = 8]) {
    return SizedBox(height: height);
  }

  static Widget horizontalSpace([double width = 8]) {
    return SizedBox(width: width);
  }
}
