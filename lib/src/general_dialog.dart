import 'package:flutter/material.dart';

class GeneralMessageDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;

  ///An alert dialog with title and content
  GeneralMessageDialog({
    this.confirmText = "OK",
    @required this.content,
    this.title = "Information",
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          child: Text(confirmText),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
