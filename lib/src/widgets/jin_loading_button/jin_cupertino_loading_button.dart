import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JinLoadingCupertinoButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;
  final EdgeInsets padding;
  final bool filled;

  const JinLoadingCupertinoButton({
    Key key,
    this.onPressed,
    this.color,
    this.child,
    this.padding,
    this.filled,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (filled) {
      return CupertinoButton.filled(
        onPressed: onPressed,
        padding: padding,
        child: child,
      );
    }
    return CupertinoButton(
      onPressed: onPressed,
      color: color,
      padding: padding,
      child: child,
    );
  }
}
