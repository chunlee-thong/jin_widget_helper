import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoiceBottomSheet extends StatelessWidget {
  final List<String> options;
  final String title;

  //a cupertino bottom sheet
  const ChoiceBottomSheet({Key key, this.options, @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      message: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      actions: options.map((option) {
        return CupertinoActionSheetAction(
          child: Text(option),
          onPressed: () {
            Navigator.pop(context, options.indexOf(option));
          },
        );
      }).toList(),
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel"),
        isDestructiveAction: true,
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, -1);
        },
      ),
    );
  }
}
