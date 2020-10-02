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
    return RaisedButton(
      onPressed: onPressed,
      shape: shape,
      elevation: elevation,
      padding: padding,
      color: color,
      textColor: textColor,
      child: child,
    );
  }
}
