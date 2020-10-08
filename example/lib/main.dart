import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:jin_widget_helper_example/widgets/jin_loading_button_example.dart';
import 'package:jin_widget_helper_example/widgets/other_button_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jin Widget Helper',
      navigatorKey: JinNavigator.navigatorKey,
      theme: ThemeData(
        primarySwatch: JinColorUtils.hexColorToMaterialColor(0xFF047AD8),
        typography: Typography.material2018(),
        buttonColor: Colors.green,
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
  void onViewPage(Widget page) {
    PageNavigator.push(context, page);
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ActionButton(
              child: Text("JinLoadingButton example"),
              margin: EdgeInsets.symmetric(vertical: 8),
              onPressed: () => onViewPage(JinLoadingButtonExample()),
            ),
            ActionButton(
              child: Text("Other Buttons example"),
              margin: EdgeInsets.symmetric(vertical: 8),
              onPressed: () => onViewPage(OtherButtonExample()),
            ),
          ],
        ),
      ),
    );
  }
}
