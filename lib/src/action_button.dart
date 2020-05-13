import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final ValueNotifier<bool> isLoading;
  final Function onPressed;
  final Color color;
  final Color loadingColor;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final ShapeBorder shape;
  final Widget child;
  final bool stretch;

  ///create a button with loading notifier
  ActionButton({
    @required this.onPressed,
    @required this.child,
    this.isLoading,
    this.color,
    this.loadingColor = Colors.white,
    this.margin = const EdgeInsets.all(8),
    this.padding = const EdgeInsets.all(12),
    this.stretch = true,
    this.shape = const StadiumBorder(),
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: stretch ? double.infinity : null,
      margin: margin,
      child: ValueListenableBuilder(
        valueListenable: isLoading ?? ValueNotifier(false),
        builder: (context, loading, child) {
          return RaisedButton(
            onPressed: loading ? () {} : onPressed,
            padding: padding,
            color: color ?? Theme.of(context).buttonColor,
            shape: shape,
            child: loading
                ? Container(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
                      strokeWidth: 3.0,
                    ),
                  )
                : child,
          );
        },
      ),
    );
  }
}
