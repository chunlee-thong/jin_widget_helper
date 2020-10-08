import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class JinLoadingButtonExample extends StatefulWidget {
  @override
  _JinLoadingButtonExampleState createState() =>
      _JinLoadingButtonExampleState();
}

class _JinLoadingButtonExampleState extends State<JinLoadingButtonExample> {
  Future<void> doingOperation() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JinLoadingButton example"),
      ),
      body: Center(
        child: Column(
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
              platform: ButtonPlatForm.Material,
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
              onPressed: doingOperation,
              color: Colors.blue,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 2,
              loadingColor: Colors.white,
              textColor: Colors.white,
              shape: JinWidget.roundRect(),
              loadingWidget: CupertinoActivityIndicator(),
              child: Text("Cupertino Style button",
                  style: TextStyle(color: Colors.white)),
              platform: ButtonPlatForm.Cupertino,
            ),
            JinLoadingButton(
              onPressed: doingOperation,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 2,
              loadingColor: Colors.white,
              textColor: Colors.white,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              loadingWidget: CupertinoActivityIndicator(),
              child: Text("Custom Shape widget"),
              platform: ButtonPlatForm.Material,
            ),
          ],
        ),
      ),
    );
  }
}
