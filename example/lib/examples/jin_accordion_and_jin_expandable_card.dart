import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class JinAccordionAndJinExpandable extends StatefulWidget {
  JinAccordionAndJinExpandable({Key key}) : super(key: key);
  @override
  _JinAccordionAndJinExpandableState createState() =>
      _JinAccordionAndJinExpandableState();
}

class _JinAccordionAndJinExpandableState
    extends State<JinAccordionAndJinExpandable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JinExpandable JinAccordion example"),
      ),
      body: Container(
        child: Column(
          children: [
            JinAccordion(
              initiallyExpand: true,
              icon: Icon(Icons.arrow_circle_down_rounded),
              onToggle: (value) {},
              iconPosition: IconPosition.End,
              showIcon: true,
              childrenBackgroundColor: Colors.cyanAccent[50],
              animatedOnStart: false,
              animationDuration: Duration(milliseconds: 300),
              title: Text("This a JinAccordion title"),
              children: [
                Text("This is a children"),
                Text("This is a children"),
                Text("This is a children"),
                Text("This is a children"),
              ],
            ),
            SpaceY(32),
            Card(
              child: JinExpandable(
                initiallyExpand: false,
                onToggle: (value) {},
                topChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Center(child: Text("This is a JinExpandable TopChild")),
                ),
                bottomChild: Column(
                  children: [
                    Text("Bottom child"),
                    Text("Bottom child"),
                    Text("Bottom child"),
                    Text("Bottom child"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
