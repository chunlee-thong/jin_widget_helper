import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class JinSimpleDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final Function onConfirm;
  final Widget child;

  ///An alert dialog with title and content
  JinSimpleDialog({
    this.child,
    this.content = "",
    this.title = "Information",
    this.confirmText = "OK",
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return JinPlatformChecker(
      androidWidget: _buildAndroidDialog(context),
      iosWidget: _buildIOSDialog(context),
    );
  }

  Widget _buildIOSDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: child ??
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(content),
          ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(confirmText),
          onPressed: () {
            onConfirm?.call();
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }

  Widget _buildAndroidDialog(BuildContext context) {
    return AlertDialog(
      shape: JinWidget.roundRect(16),
      title: Text(title),
      content: child ?? Text(content),
      actions: <Widget>[
        FlatButton(
          child: Text(confirmText),
          onPressed: () {
            onConfirm?.call();
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
