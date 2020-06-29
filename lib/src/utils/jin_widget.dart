import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JinWidget {
  ///Create a sizedBox with set height
  static Widget verticalSpace([double height = 8]) {
    return SizedBox(height: height);
  }

  ///Create a sizedBox with set width
  static Widget horizontalSpace([double width = 8]) {
    return SizedBox(width: width);
  }

  ///Create a RoundRectangleBorder with given radius
  static RoundedRectangleBorder roundRect([double radius = 8]) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }

  static RoundedRectangleBorder roundRectTop([double radius = 8]) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)));
  }

  static RoundedRectangleBorder roundRectBottom([double radius = 8]) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)));
  }

  static RoundedRectangleBorder roundRectLeft([double radius = 8]) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(8)));
  }

  static RoundedRectangleBorder roundRectRight([double radius = 8]) {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(8)));
  }

  ///Create a border Radius
  static BorderRadius radius([double radius = 8]) {
    return BorderRadius.circular(radius);
  }

  static final loadingChild = Platform.isIOS
      ? CupertinoActivityIndicator()
      : CircularProgressIndicator();
}
