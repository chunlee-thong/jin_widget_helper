import 'dart:async';

import 'package:flutter/material.dart';

import '../../../jin_widget_helper.dart';

abstract class JinBaseLoadingButton extends StatefulWidget {
  final Widget child;
  final Widget startIcon;
  final Widget endIcon;
  final Widget loadingWidget;
  final Color loadingColor;
  final FutureOr<void> Function() onPressed;
  final LoadingType loadingType;

  const JinBaseLoadingButton({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.loadingWidget,
    this.loadingColor,
    this.startIcon,
    this.endIcon,
    this.loadingType,
  }) : super(key: key);
}

abstract class JinBaseLoadingButtonState<T extends JinBaseLoadingButton>
    extends State<T> {
  ValueNotifier<bool> loadingNotifier = ValueNotifier(false);

  void onButtonPressed() async {
    try {
      toggleLoading();
      await widget.onPressed?.call();
      toggleLoading();
    } catch (exception) {
      toggleLoading();
      throw exception;
    }
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
    final Widget buttonContent = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.startIcon != null) ...[
          widget.startIcon,
          SpaceX(),
        ],
        widget.child,
        if (widget.endIcon != null) ...[
          SpaceX(),
          widget.endIcon,
        ],
      ],
    );

    final Widget loadingWidget = widget.loadingWidget ?? _buildLoadingWidget();

    return ValueObserver<bool>(
      valueNotifier: loadingNotifier,
      child: (isLoading) {
        return buildButton(
          context: context,
          onPressed: isLoading
              ? widget.loadingType == LoadingType.Disable
                  ? null
                  : () {}
              : widget.onPressed != null
                  ? this.onButtonPressed
                  : null,
          child: ConditionalWidget(
            condition: isLoading,
            onTrue: widget.loadingType == LoadingType.Disable
                ? buttonContent
                : loadingWidget,
            onFalse: buttonContent,
          ),
        );
      },
    );
  }

  Widget _buildLoadingWidget() {
    return SizedBox(
      width: widget.startIcon != null ? 24 : 20,
      height: widget.startIcon != null ? 24 : 20,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(widget.loadingColor),
      ),
    );
  }
}
