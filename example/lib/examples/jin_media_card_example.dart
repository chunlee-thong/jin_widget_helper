import 'package:flutter/material.dart';

class JinMediaCardExample extends StatefulWidget {
  JinMediaCardExample({Key key}) : super(key: key);
  @override
  _JinMediaCardExampleState createState() => _JinMediaCardExampleState();
}

class _JinMediaCardExampleState extends State<JinMediaCardExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JinMediaCard example"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        children: [],
      ),
    );
  }
}
