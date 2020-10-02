import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoOptionActionSheet extends StatelessWidget {
  ///When you tap on [options], it will return it's index value as a result
  final List<String> options;
  final String title;
  final String cancelText;
  final void Function(String option, int index) onSelected;
  //Create a cupertino bottom sheet with list of option
  const CupertinoOptionActionSheet({
    Key key,
    this.options,
    @required this.title,
    this.cancelText = "Cancel",
    this.onSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      message: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      actions: List.generate(options.length, (index) {
        final option = options[index];
        return CupertinoActionSheetAction(
          child: Text(option),
          onPressed: () {
            onSelected?.call(option, index);
            Navigator.pop(context, index);
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
