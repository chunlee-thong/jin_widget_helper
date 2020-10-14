import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class DialogAndSheetExample extends StatefulWidget {
  DialogAndSheetExample({Key key}) : super(key: key);
  @override
  _DialogAndSheetExampleState createState() => _DialogAndSheetExampleState();
}

class _DialogAndSheetExampleState extends State<DialogAndSheetExample> {
  JinLoadingDialog jinLoadingDialog;

  void showSimpleDialog(String content) {
    showDialog(
      context: context,
      builder: (context) => JinSimpleDialog(
        content: content,
        title: "This is a title",
        confirmText: "OK",
        onConfirm: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    jinLoadingDialog = JinLoadingDialog(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog and sheet example"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text("Show JinSimpleDialog"),
              onPressed: () {
                showSimpleDialog(
                    "This is a simple dialog that adaptive to platform");
              },
            ),
            RaisedButton(
              child: Text("Show JinConfirmationDialog"),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => JinConfirmationDialog(
                    content: Text("Do you like this widget?"),
                    title: "Hello there!",
                    confirmText: "Yes",
                    cancelText: "No",
                    onConfirm: () {
                      print("You confirmed");
                    },
                    onCancel: () {
                      print("You canceled");
                    },
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text("Show JinLoadingDialog"),
              onPressed: () async {
                jinLoadingDialog.show(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Loading...."),
                      SpaceY(),
                      CircularProgressIndicator(),
                    ],
                  ),
                );
                await Future.delayed(Duration(seconds: 3));
                jinLoadingDialog.hide();
              },
            ),
            RaisedButton(
              child: Text("Show CupertinoOptionActionSheet"),
              onPressed: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoOptionActionSheet(
                        title: "Choose your fighter",
                        options: ["Ryu", "Ken"],
                        onSelected: (name, index) {
                          print(name);
                          showSimpleDialog("You chose $name");
                        },
                      );
                    });
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
