import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class OtherButtonExample extends StatefulWidget {
  @override
  _OtherButtonExampleState createState() => _OtherButtonExampleState();
}

class _OtherButtonExampleState extends State<OtherButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomBackButton(
              header: "Custom Back Button Header",
              icon: Icon(Icons.arrow_back),
              backgroundColor: Colors.blue,
            ),
            SpaceY(),
            buildButtonCategory(
              name: "Small Icon Button",
              button: SmallIconButton(
                icon: Icon(Icons.add_a_photo_rounded, color: Colors.white),
                margin: EdgeInsets.symmetric(vertical: 4),
                onTap: () {},
                backgroundColor: Colors.orangeAccent,
              ),
            ),
            buildButtonCategory(
              name: "Small Flat Button",
              button: SmallFlatButton(
                icon: Icon(Icons.add_a_photo_rounded, color: Colors.white),
                child: Text("Click me"),
                margin: EdgeInsets.symmetric(vertical: 4),
                onTap: () {},
                backgroundColor: Colors.lightGreen,
              ),
            ),
            buildButtonCategory(
              name: "Badge Button",
              button: BadgeButton(
                icon: Icon(Icons.notifications, color: Colors.blue),
                margin: EdgeInsets.symmetric(vertical: 4),
                onTap: () {},
                badgeText: "10",
                showBadge: true,
                badgeColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonCategory({String name, Widget button}) {
    return Column(
      children: [
        Text(name),
        SpaceY(),
        button,
        Divider(),
      ],
    );
  }
}
