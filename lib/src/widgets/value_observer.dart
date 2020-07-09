import 'package:flutter/material.dart';

class ValueObserver<T> extends StatelessWidget {
  final ValueNotifier<T> valueNotifier;
  final Widget Function(T) child;

  //A ValueListenableBuilder with cleaner look code
  const ValueObserver({
    Key key,
    @required this.valueNotifier,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (context, T data, _) {
        return child(data);
      },
    );
  }
}
