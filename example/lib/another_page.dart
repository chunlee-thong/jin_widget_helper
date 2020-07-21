import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class AnotherPage extends StatefulWidget {
  @override
  _AnotherPageState createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  bool isExpand = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Another Page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              child: JinAccordion(
                onToggle: (value) {
                  print("Expand: $value");
                },
                titlePadding: EdgeInsets.zero,
                initiallyExpand: true,
                title: ListTile(
                  leading: Icon(Icons.call),
                  title: Text("My title"),
                  subtitle: Text("Hello"),
                ),
                showIcon: true,
                iconPosition: IconPosition.End,
                children: <Widget>[
                  Text("I am a child"),
                  RaisedButton(
                    child: Text("clik me"),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            MiniListTile(
              title: Text("My New group"),
              subtitle: Text("My subtitle"),
              leading: CircleAvatar(),
              trailing: SmallIconButton(
                icon: Icon(Icons.edit),
                onTap: () {},
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text("My New group"),
              subtitle: Text("My subtitle"),
              leading: CircleAvatar(),
              trailing: SmallIconButton(
                icon: Icon(Icons.edit),
                onTap: () {},
              ),
              onTap: () {},
            ),
            JinExpandableText(
              subStringLength: 12,
              text: "It is a long established fact that a reader will be",
            ),
            Stack(
              children: <Widget>[
                JinExpandableCard(
                  isExpand: isExpand,
                  margin: EdgeInsets.only(bottom: 24),
                  padding: EdgeInsets.zero,
                  topContent: ListTile(
                    title: Text("Hello"),
                  ),
                  bottomContent: ListTile(
                    title: Text("Hello"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 24,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        isExpand = !isExpand;
                      });
                    },
                    color: Colors.orange,
                    child: Text("See more"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
