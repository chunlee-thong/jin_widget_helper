import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

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
        children: [
          JinMediaCard(
            alignment: Axis.horizontal,
            mediaBuilder: MediaBuilder(
              width: (size) => size / 3,
              child: Image.network(
                JinUtils.randomStringImage(),
                fit: BoxFit.cover,
              ),
            ),
            height: (size) => 156,
            mainAxisSpacing: 16,
            infoBuilder: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("This is a horizontal JinMediaCard"),
                SpaceY(),
                Text("This card has a height of 150"),
                SpaceY(),
                Text("This card has an Image with 1/3 of screen width"),
                SpaceY(),
                Text("This card has default elevation of 2.0").flexible,
              ],
            ),
          ),
          SpaceY(16),
          Container(
            height: 250,
            child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.symmetric(vertical: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return JinMediaCard(
                  width: (size) => size.width / 2.5,
                  alignment: Axis.vertical,
                  margin: EdgeInsets.only(right: 12),
                  height: (width) => double.infinity,
                  mediaBuilder: MediaBuilder(
                    radius: JinWidget.radius(12),
                    child: Image.network(
                      JinUtils.randomCategoryStringImage(
                        category: "dog",
                        dimension: 100,
                      ),
                      fit: BoxFit.cover,
                    ),
                    width: (wdith) => double.infinity,
                  ),
                  infoBuilder: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("This is a vertical JinMediaCard"),
                      SpaceY(12),
                      Text("Mostly use in GrdiView or Horizontal ListView"),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
