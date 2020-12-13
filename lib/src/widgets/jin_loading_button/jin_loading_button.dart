import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:jin_widget_helper/src/widgets/jin_loading_button/jin_base_loading_button.dart';
import 'package:jin_widget_helper/src/widgets/jin_loading_button/jin_cupertino_loading_button.dart';
import 'package:jin_widget_helper/src/widgets/jin_loading_button/jin_material_loading_button.dart';

enum ButtonPlatForm { Material, Cupertino, Adaptive }

enum LoadingType { Progress, Disable }

class JinLoadingButton extends JinBaseLoadingButton {
  ///A [child] to display inside the button
  final Widget child;

  ///onPressed callback
  final Future<void> Function() onPressed;

  ///[startIcon] will show on the left side of the button
  final Widget startIcon;

  ///[endIcon] will show on the left side of the button
  final Widget endIcon;

  ///A widget to show when button is loading
  final Widget loadingWidget;

  final double width;

  final double height;

  ///Button's background color
  final Color color;

  ///Button's text color [Android only]
  final Color textColor;

  ///A color for default [loadingWidget]
  final Color loadingColor;

  ///Button shape [Android only]
  final ShapeBorder shape;

  ///[Android only]
  final double elevation;

  ///Button's margin, default value is [vertical: 16]
  final EdgeInsets margin;
  final EdgeInsets padding;

  ///whether button is set to stretch with available width
  final bool fullWidth;

  ///[IOS only]
  final bool filled;

  ///Show button type base on Platform [Android, IOS, or Adaptive]
  final ButtonPlatForm platform;

  /// select a loading type of the button
  final LoadingType loadingType;

  const JinLoadingButton({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.width,
    this.height,
    this.startIcon,
    this.endIcon,
    this.loadingWidget,
    this.color,
    this.textColor,
    this.loadingColor = Colors.white,
    this.shape,
    this.elevation = 2,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.fullWidth = true,
    this.filled = false,
    this.platform = ButtonPlatForm.Material,
    this.loadingType = LoadingType.Progress,
  }) : super(
          key: key,
          child: child,
          startIcon: startIcon,
          endIcon: endIcon,
          onPressed: onPressed,
          loadingColor: loadingColor,
          loadingWidget: loadingWidget,
          loadingType: loadingType,
        );

  @override
  _JinLoadingButtonState createState() => _JinLoadingButtonState();
}

class _JinLoadingButtonState
    extends JinBaseLoadingButtonState<JinLoadingButton> {
  @override
  Widget buildButton(
      {BuildContext context, Widget child, VoidCallback onPressed}) {
    ///Create a material button
    final materialButton = Container(
      height: widget.height,
      width: widget.fullWidth ? double.infinity : widget.width,
      margin: widget.margin,
      child: JinLoadingMaterialButton(
        onPressed: onPressed,
        child: child,
        elevation: widget.elevation,
        padding: widget.padding,
        color: widget.color ?? Theme.of(context).buttonColor,
        textColor: widget.textColor,
        shape: widget.shape,
        key: widget.key,
      ),
    );

    ///Create a cupertino button
    final cupertinoButton = Container(
      height: widget.height,
      width: widget.fullWidth ? double.infinity : widget.width,
      margin: widget.margin,
      child: JinLoadingCupertinoButton(
        onPressed: onPressed,
        child: child,
        padding: widget.padding,
        color: widget.color,
        filled: widget.filled,
        key: widget.key,
      ),
    );

    ///
    if (widget.platform == ButtonPlatForm.Material) {
      return materialButton;
    } else if (widget.platform == ButtonPlatForm.Cupertino) {
      return cupertinoButton;
    } else {
      return JinPlatformChecker(
        androidWidget: materialButton,
        iosWidget: cupertinoButton,
      );
    }
  }
}
