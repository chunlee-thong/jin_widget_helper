import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoiceBottomSheet extends StatelessWidget {
  ///When you tap on [options], it will return it's index value as a result
  final List<String> options;
  final String title;
  final String cancelText;

  //Create a cupertino bottom sheet with list of option
  const ChoiceBottomSheet({
    Key key,
    this.options,
    @required this.title,
    this.cancelText = "Cancel",
  }) : super(key: key);
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
        child: Text(cancelText),
        isDestructiveAction: true,
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, -1);
        },
      ),
    );
  }
}
