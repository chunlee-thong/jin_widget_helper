import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class JinLoadingDialog {
  final bool dismissible;
  BuildContext _dialogContext;
  BuildContext context;

  JinLoadingDialog(
    this.context, {
    this.dismissible = true,
  });

  Future<void> show({Widget child}) async {
    final dialogChild = child ?? JinWidget.platformLoadingWidget();
    showDialog(
        context: context,
        barrierDismissible: dismissible,
        builder: (dialogContext) {
          this._dialogContext = dialogContext;
          return WillPopScope(
            onWillPop: () async {
              if (dismissible) _dialogContext = null;
              return dismissible;
            },
            child: Dialog(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: dialogChild,
                ),
                widthFactor: 1.0,
                heightFactor: 1.0,
              ),
            ),
          );
        });
    await Future.delayed(Duration(milliseconds: 500));
  }

  Future<void> hide() async {
    if (_dialogContext != null) Navigator.of(_dialogContext).pop();
  }
}
