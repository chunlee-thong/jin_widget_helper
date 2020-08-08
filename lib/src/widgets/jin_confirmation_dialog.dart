import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/src/widgets/jin_platform_checker.dart';
import 'package:jin_widget_helper/src/utils/jin_extension.dart';

class JinConfirmationDialog extends StatelessWidget {
  final String confirmText;
  final String cancelText;
  final Widget content;
  final String title;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  ///A dialog that provide onCancel and Confirm action
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
            Navigator.of(context).pop(true);
            if (onCancel != null) onCancel();
          },
        ),
        CupertinoDialogAction(
          child: Text(confirmText),
          onPressed: () {
            Navigator.of(context).pop(true);
            if (onConfirm != null) onConfirm();
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
            Navigator.of(context).pop(false);
            if (onCancel != null) onCancel();
          },
        ),
        FlatButton(
          child: Text(confirmText),
          onPressed: () {
            Navigator.of(context).pop(true);
            if (onConfirm != null) onConfirm();
          },
        ),
      ],
    );
  }
}
