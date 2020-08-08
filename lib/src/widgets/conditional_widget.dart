import 'package:flutter/material.dart';

///build a widget depend on provided [condition]
class ConditionalWidget extends StatelessWidget {
  final bool condition;
  final Widget onTrue;
  final Widget onFalse;
  final EdgeInsets margin;
  final EdgeInsets padding;

  const ConditionalWidget({
    Key key,
    @required this.condition,
    @required this.onTrue,
    this.onFalse,
    this.margin,
    this.padding,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      margin: margin ?? EdgeInsets.zero,
      child: condition ? onTrue : onFalse ?? const SizedBox(),
    );
  }
}
