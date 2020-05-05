import 'package:flutter/material.dart';

class ValueHandler<T> extends StatelessWidget {
  final ValueNotifier<T> valueNotifier;
  final Widget Function(T) child;

  const ValueHandler(
      {Key key, @required this.valueNotifier, @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, data, _) {
        return child(data);
      },
    );
  }
}
