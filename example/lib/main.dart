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

class _MyHomePageState extends State<MyHomePage> {
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
      body: ListView(
        children: <Widget>[
          MiniListTile(
            aligment: CrossAxisAlignment.start,
            leading: Icon(Icons.aspect_ratio),
            title: Text("Nice"),
            subtitle: Text("this is a subtitle"),
            trailing: SmallFlatButton(
              child: Text("Nice"),
              onTap: () {},
              icon: Icon(Icons.add),
            ),
            onTap: () {},
            separator: Divider(height: 0),
          ),
        ],
      ),
    );
  }
}
