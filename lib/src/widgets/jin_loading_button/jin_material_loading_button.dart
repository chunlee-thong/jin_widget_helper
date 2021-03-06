import 'package:flutter/material.dart';

class JinLoadingMaterialButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final ShapeBorder shape;
  final EdgeInsets padding;
  final double elevation;

  const JinLoadingMaterialButton({
    Key key,
    this.onPressed,
    this.color,
    this.textColor,
    this.shape,
    this.child,
    this.padding,
    this.elevation,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: shape,
        elevation: elevation,
        padding: padding,
        primary: color,
        onPrimary: textColor,
      ),
      child: child,
    );
  }
}
