import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomBackButton(
            header: "New Page",
            marginLeft: 8,
          ),
        ],
      ),
    );
  }
}
