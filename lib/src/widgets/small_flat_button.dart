import 'package:flutter/material.dart';

class SmallFlatButton extends StatelessWidget {
  final Function onTap;
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color backgroundColor;
  final double borderRadius;
  final double elevation;
  final Color textColor;

  ///A FlatButton with respectively small margin and shape
  const SmallFlatButton({
    Key key,
    @required this.onTap,
    @required this.child,
    this.margin = const EdgeInsets.all(8),
    this.padding = const EdgeInsets.all(8),
    this.borderRadius = 8,
    this.backgroundColor = Colors.transparent,
    this.elevation = 0.0,
    this.textColor = Colors.black,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius));
    return Card(
      shape: shape,
      color: backgroundColor,
      elevation: elevation,
      margin: margin,
      child: InkWell(
        onTap: onTap,
        customBorder: shape,
        child: Padding(
          padding: padding,
          child: DefaultTextStyle.merge(
            style:
                Theme.of(context).textTheme.button.copyWith(color: textColor),
            child: child,
          ),
        ),
      ),
    );
  }
}
