import 'package:flutter/material.dart';
import 'package:jin_widget_helper/src/widgets/spacing.dart';

class ActionButton extends StatelessWidget {
  ///recieve a ValueNotifier to indicate wether to show the loading or child
  final ValueNotifier<bool> isLoading;
  final Function onPressed;
  final Function onLongPressed;
  final double elevation;
  //Button's background Color
  final Color color;
  final Color textColor;
  //Loading indicator's color
  final Color loadingColor;
  final Widget loadingWidget;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final ShapeBorder shape;
  final Widget child;
  final Widget icon;

  ///if [stretch] is `true`, Button will take all remaining horizontal space
  final bool stretch;

  ///Create a button with loading notifier
  ActionButton({
    @required this.onPressed,
    @required this.child,
    this.isLoading,
    this.loadingWidget,
    this.color,
    this.icon,
    this.loadingColor = Colors.white,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.stretch = true,
    this.shape = const StadiumBorder(),
    this.onLongPressed,
    this.elevation = 2.0,
    this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: stretch ? double.infinity : null,
      color: Colors.transparent,
      margin: margin,
      child: ValueListenableBuilder(
        valueListenable: isLoading ?? ValueNotifier(false),
        builder: (context, loading, _) {
          return RaisedButton(
            onPressed: loading ? () {} : onPressed,
            padding: padding,
            textColor: textColor ?? null,
            elevation: elevation,
            onLongPress:
                loading || onLongPressed == null ? () {} : onLongPressed,
            color: color ?? Theme.of(context).buttonColor,
            shape: shape,
            child: loading
                ? loadingWidget ??
                    Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
                        strokeWidth: 3.0,
                      ),
                    )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      icon ?? SizedBox(),
                      if (icon != null) SpaceX(8),
                      child,
                    ],
                  ),
          );
        },
      ),
    );
  }
}
