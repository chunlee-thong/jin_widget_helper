import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:jin_widget_helper/src/widgets/spacing.dart';

class ActionButton extends StatelessWidget {
  ///recieve a ValueNotifier to indicate wether to show the loading or child
  final ValueNotifier<bool> loadingNotifier;
  final VoidCallback onPressed;
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

  ///if [fullWidth] is `true`, Button will take all remaining horizontal space
  final bool fullWidth;

  ///Create a button with loading notifier
  ActionButton({
    @required this.onPressed,
    @required this.child,
    this.loadingNotifier,
    this.loadingWidget,
    this.color,
    this.icon,
    this.loadingColor = Colors.white,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.fullWidth = true,
    this.shape = const StadiumBorder(),
    this.onLongPressed,
    this.elevation = 2.0,
    this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? double.infinity : null,
      color: Colors.transparent,
      margin: margin,
      child: ValueListenableBuilder<bool>(
        valueListenable: loadingNotifier ?? ValueNotifier(false),
        builder: (context, loading, _) {
          return RaisedButton(
            onPressed: loading ? () {} : onPressed,
            padding: padding,
            textColor: textColor,
            elevation: elevation,
            onLongPress: loading ? () {} : onLongPressed,
            color: color ?? Theme.of(context).buttonColor,
            shape: shape,
            child: ConditionalWidget(
              condition: loading,
              onFalse: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  icon ?? const SizedBox(),
                  if (icon != null) SpaceX(8),
                  child,
                ],
              ),
              onTrue: loadingWidget ?? _buildLoadingWidget(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return SizedBox(
      width: icon != null ? 24 : 20,
      height: icon != null ? 24 : 20,
      child: JinWidget.platformLoadingWidget(color: loadingColor),
    );
  }
}
