import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class JinExtensionExample extends StatefulWidget {
  @override
  _JinExtensionExampleState createState() => _JinExtensionExampleState();
}

class _JinExtensionExampleState extends State<JinExtensionExample> {
  final utcDateTime = DateTime.parse("2020-10-09T06:48:17.030Z");
  final today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JinExtension Example'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        children: [
          buildExtensionCategory(
            name: "DateTime Extension",
            children: [
              Text(
                  "Format date: ${utcDateTime.formatDate("dd MMM yyyy HH:mm a")}"),
              Text(
                  "Format to Local: ${utcDateTime.formatToLocalDate("dd MMM yyyy HH:mm a")}"),
              Text("Is the same day: ${today.isTheSameDay(DateTime.now())}"),
            ],
          ),
          buildExtensionCategory(
            name: "Widget Extension",
            children: [
              Text("Padding extension").padding(EdgeInsets.all(16)),
              Text("PaddingValue extension")
                  .paddingValue(horizontal: 12, vertical: 16),
              Text("Margin extension").margin(EdgeInsets.all(16)),
              Text("marginValue extension")
                  .marginValue(horizontal: 12, vertical: 16),
              Text("CSS Spacing").cssSpacing(margin: [6], padding: [4, 6]),
              Text("Opacity").opacity(0.5),
              Text("Text Color").textColor(Colors.red),
              Text("Apply style").applyStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              Text("Rotate").rotate(45).marginValue(vertical: 16),
            ],
          ),
          buildExtensionCategory(
            name: "TextStyle Extension",
            children: [
              Text(
                "Apply normal,medium or bold",
                style: TextStyle().normal.medium.bold,
              ).padding(EdgeInsets.all(16)),
              Text(
                "Apply text color",
                style: TextStyle().applyColor(Colors.green),
              ).padding(EdgeInsets.all(16)),
              Text(
                "Apply font size",
                style: TextStyle().applyFontSize(24),
              ).padding(EdgeInsets.all(16)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildExtensionCategory({String name, List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        SpaceY(),
        ...children,
        Divider(),
      ],
    );
  }
}
