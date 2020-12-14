import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class JinLoadingButtonExample extends StatefulWidget {
  @override
  _JinLoadingButtonExampleState createState() =>
      _JinLoadingButtonExampleState();
}

class _JinLoadingButtonExampleState extends State<JinLoadingButtonExample> {
  JinLoadingDialog jinLoadingDialog;
  Future<void> doingOperation() async {
    //jinLoadingDialog.show(child: Text("Loading..."));
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    jinLoadingDialog = JinLoadingDialog(context, dismissible: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("JinLoadingButton example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            JinLoadingButton(
              onPressed: doingOperation,
              fullWidth: false,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 2,
              loadingColor: Colors.white,
              textColor: Colors.white,
              shape: JinWidget.roundRect(),
              child: Text("Click me"),
              startIcon: Icon(Icons.add),
              //padding: EdgeInsets.symmetric(vertical: 12.0),
              platform: ButtonPlatForm.Material,
              //loadingType: LoadingType.Disable,
            ),
            JinLoadingButton(
              onPressed: doingOperation,
              fullWidth: false,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 2,
              loadingColor: Colors.red,
              textColor: Colors.white,
              shape: JinWidget.roundRect(),
              child: Icon(Icons.send),
              padding: EdgeInsets.zero,
              platform: ButtonPlatForm.Material,
            ),
            JinLoadingButton(
              onPressed: doingOperation,
              fullWidth: false,
              width: 300,
              height: 54,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 2,
              loadingColor: Colors.white,
              textColor: Colors.white,
              shape: JinWidget.roundRect(),
              child: Text("Custom width and height"),
              platform: ButtonPlatForm.Material,
              loadingType: LoadingType.Disable,
            ),
            JinLoadingButton(
              onPressed: doingOperation,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 2,
              loadingColor: Colors.white,
              textColor: Colors.white,
              shape: JinWidget.roundRect(),
              child: Text("Full width button"),
              platform: ButtonPlatForm.Material,
            ),
            JinLoadingButton(
              startIcon: Icon(Icons.add),
              onPressed: doingOperation,
              color: Colors.blue,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 2,
              loadingColor: Colors.white,
              textColor: Colors.black,
              shape: JinWidget.roundRect(),
              loadingWidget: CupertinoActivityIndicator(),
              loadingType: LoadingType.Disable,
              child: Text("Cupertino Style button",
                  style: TextStyle(color: Colors.black)),
              platform: ButtonPlatForm.Cupertino,
            ),
            JinLoadingButton(
              onPressed: doingOperation,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 2,
              fullWidth: false,
              loadingColor: Colors.white,
              textColor: Colors.black,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              //loadingWidget: CupertinoActivityIndicator(),
              child: Text(
                "Test",
                style: TextStyle(fontSize: 44),
              ),
              platform: ButtonPlatForm.Material,
            ),
          ],
        ),
      ),
    );
  }
}
