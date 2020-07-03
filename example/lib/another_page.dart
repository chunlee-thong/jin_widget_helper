import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class AnotherPage extends StatefulWidget {
  @override
  _AnotherPageState createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Another Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
          ],
        ),
      ),
    );
  }
}
