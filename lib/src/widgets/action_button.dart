import 'package:flutter/material.dart';

import 'conditional_widget.dart';
import 'spacing.dart';

/// SuraRaisedButton can be use sometime to replace RaisedButton or ElevatedButton because we provide more flexibility and wrap around
class ActionButton extends StatelessWidget {
  ///receive a ValueNotifier to indicate a loading widget
  final ValueNotifier<bool> loadingNotifier;
  final Widget child;
  final Widget icon;
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
  final MainAxisAlignment alignment;

  ///if [fullWidth] is `true`, Button will take all remaining horizontal space
  final bool fullWidth;
  final BorderSide borderSide;

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
    this.alignment,
    this.borderSide,
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
          return ElevatedButton(
            onPressed: loading ? () {} : onPressed,
            style: ElevatedButton.styleFrom(
              shape: shape,
              primary: color,
              onPrimary: textColor,
              padding: padding,
              elevation: elevation,
              side: borderSide,
            ),
            onLongPress: loading ? () {} : onLongPressed,
            child: ConditionalWidget(
              condition: loading,
              onFalse: Row(
                mainAxisAlignment: alignment ?? MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (icon != null) ...[
                    icon,
                    SpaceX(8),
                  ],
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
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
      ),
    );
  }
}
