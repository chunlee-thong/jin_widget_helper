import 'package:flutter/material.dart';

class ConditionalWidget extends StatelessWidget {
  final bool condition;
  final Widget onTrue;
  final Widget onFalse;

  const ConditionalWidget({
    Key key,
    @required this.condition,
    @required this.onTrue,
    this.onFalse,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return condition ? onTrue : onFalse ?? const SizedBox();
  }
}
