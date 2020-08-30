import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class JinSimpleDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final Function onConfirm;

  ///An alert dialog with title and content
  JinSimpleDialog({
    this.confirmText = "OK",
    @required this.content,
    this.title = "Information",
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
      content: Text(content).margin(EdgeInsets.only(top: 12)),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(confirmText),
          onPressed: () {
            if (onConfirm != null) onConfirm();
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }

  Widget _buildAndroidDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          child: Text(confirmText),
          onPressed: () {
            if (onConfirm != null) onConfirm();
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
