import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jin Widget Helper',
      navigatorKey: JinNavigator.navigatorKey,
      theme: ThemeData(
        primarySwatch: JinColorUtils.hexColorToMaterialColor(0xff08f7ff),
        buttonColor: Colors.green,
        typography: Typography.material2018(),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with FormPageMixin {
  void onClick() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      throw "erorr";
    } catch (e) {
      JinNavigator.dialog(JinSimpleDialog(content: "Hello"));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jin Widget Helper Example"),
      ),
      body: Center(
        child: JinLoadingButton(
          margin: EdgeInsets.symmetric(horizontal: 32),
          platform: ButtonPlatForm.Cupertino,
          child: Text("Click"),
          icon: Icon(Icons.add),
          onPressed: () async => onClick(),
          fullWidth: true,
          color: Colors.green,
          filled: false,
          loadingColor: Colors.white,
        ),
      ),
    );
  }
}
