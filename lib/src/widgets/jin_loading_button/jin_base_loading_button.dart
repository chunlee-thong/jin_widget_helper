import 'package:flutter/material.dart';

import '../../../jin_widget_helper.dart';

abstract class JinBaseLoadingButton extends StatefulWidget {
  final Widget child;
  final Widget icon;
  final Widget loadingWidget;
  final Color loadingColor;
  final Future<void> Function() onPressed;

  const JinBaseLoadingButton({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.loadingWidget,
    this.loadingColor,
    this.icon,
  }) : super(key: key);
}

abstract class JinBaseLoadingButtonState<T extends JinBaseLoadingButton>
    extends State<T> {
  ValueNotifier<bool> loadingNotifier = ValueNotifier(false);

  void onButtonPressed() async {
    toggleLoading();
    await widget.onPressed?.call();
    toggleLoading();
  }

  void toggleLoading() {
    loadingNotifier.value = !loadingNotifier.value;
  }

  @override
  void dispose() {
    loadingNotifier.dispose();
    super.dispose();
  }

  Widget buildButton({
    BuildContext context,
    Widget child,
    VoidCallback onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return buildButton(
      context: context,
      onPressed: widget.onPressed != null ? this.onButtonPressed : null,
      child: ValueObserver(
        valueNotifier: loadingNotifier,
        child: (isLoading) {
          if (isLoading) {
            return widget.loadingWidget ??
                SizedBox(
                  width: widget.icon != null ? 24 : 20,
                  height: widget.icon != null ? 24 : 20,
                  child: JinWidget.platformLoadingWidget(
                      color: widget.loadingColor),
                );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) ...[
                  widget.icon,
                  SpaceX(),
                ],
                widget.child,
              ],
            );
          }
        },
      ),
    );
  }
}