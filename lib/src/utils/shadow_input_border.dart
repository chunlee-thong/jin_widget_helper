import 'package:flutter/material.dart';

class ShadowInputBorder extends InputBorder {
  final BorderRadius borderRadius;
  final double elevation;
  final Color shadowColor;
  final Color fillColor;

  /// Creates an shadow border for an [InputDecorator]
  ///
  ///the [fillColor] parameter is required to cover the shadow beneath the TextField
  ///so [fillColor] value from original TextField will be ignore
  ///
  /// The [borderRadius] parameter defaults to a value where the top left
  /// and right corners have a circular radius of 8.0. The [borderRadius]
  /// parameter must not be null.
  ShadowInputBorder({
    @required this.elevation,
    @required this.fillColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.shadowColor = Colors.black87,
  }) : assert(elevation != null);

  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(2);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return Path()
      ..addRRect(borderRadius
          .resolve(textDirection)
          .toRRect(rect)
          .deflate(borderSide.width));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  bool get isOutline => true;

  @override
  void paint(Canvas canvas, Rect rect,
      {double gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection textDirection}) {
    final paint = Paint()..color = fillColor ?? Colors.white;
    final RRect outer = borderRadius.toRRect(rect);
    canvas.drawShadow(getOuterPath(rect), shadowColor, elevation, false);
    canvas.drawRRect(outer, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return ShadowInputBorder(elevation: elevation, fillColor: fillColor);
  }

  @override
  InputBorder copyWith({BorderSide borderSide}) {
    return ShadowInputBorder(elevation: elevation, fillColor: fillColor);
  }
}
