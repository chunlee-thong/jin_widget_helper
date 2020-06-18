import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class JinConfirmationDialog extends StatelessWidget {
  final String confirmText;
  final String cancelText;
  final Widget content;
  final String title;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  ///An alert dialog with title and content
  JinConfirmationDialog({
    this.confirmText = "OK",
    this.cancelText = "Cancel",
    this.title = "Confirmation",
    @required this.content,
    this.onCancel,
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
      content: content.margin(EdgeInsets.only(top: 12)),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(cancelText),
          isDestructiveAction: true,
          onPressed: () {
            if (onCancel != null) onCancel();
            Navigator.of(context).pop(true);
          },
        ),
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
      content: content,
      actions: <Widget>[
        FlatButton(
          textColor: Colors.red,
          child: Text(cancelText),
          onPressed: () {
            if (onCancel != null) onCancel();
            Navigator.of(context).pop(false);
          },
        ),
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
