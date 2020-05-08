import 'package:flutter/material.dart';

class ColorUtils {
  //get color from hex code
  static Color getColorFromCode(String code) {
    try {
      String hexAlphaPrefix = '0xFF';
      String colorCode;

      if (code.contains(hexAlphaPrefix)) {
        colorCode = code;
      } else {
        colorCode = '0xFF' + code.replaceAll("#", "");
      }

      return Color(int.parse(colorCode));
    } catch (e) {
      throw "Invalid color format";
    }
  }

  static Color fromRGB(int r, int g, int b, [double opacity = 1]) {
    try {
      final color = Color.fromRGBO(r, g, b, opacity);
      return color;
    } catch (e) {
      throw "Invalid color format";
    }
  }

  static MaterialColor hexColorToMaterialColor(int hexColor) {
    final color = Color(hexColor);
    final r = color.red;
    final g = color.green;
    final b = color.blue;

    return MaterialColor(
      hexColor,
      <int, Color>{
        50: Color.fromRGBO(r, g, b, .1),
        100: Color.fromRGBO(r, g, b, .2),
        200: Color.fromRGBO(r, g, b, .3),
        300: Color.fromRGBO(r, g, b, .4),
        400: Color.fromRGBO(r, g, b, .5),
        500: Color.fromRGBO(r, g, b, .6),
        600: Color.fromRGBO(r, g, b, .7),
        700: Color.fromRGBO(r, g, b, .8),
        800: Color.fromRGBO(r, g, b, .9),
        900: Color.fromRGBO(r, g, b, 1),
      },
    );
  }
}
