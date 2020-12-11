import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:toast/toast.dart';

class OtherWidgetsExample extends StatefulWidget {
  OtherWidgetsExample({Key key}) : super(key: key);
  @override
  _OtherWidgetsExampleState createState() => _OtherWidgetsExampleState();
}

class _OtherWidgetsExampleState extends State<OtherWidgetsExample> {
  final count = 0.obs<int>();

  final data = ValueNotifier<int>(null);

  @override
  void dispose() {
    count.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Other widget example")),
      body: ConnectionChecker(
        reactToConnectionChange: false,
        onConnectionChange: (hasConnection) {
          Toast.show("Has connection?: $hasConnection", context);
        },
        message: "Look like you dont have internet connection",
        onNoInternet: (message) {
          return Column(
            children: [
              Icon(Icons.electrical_services_rounded),
              Text(message),
            ],
          );
        },
        child: Column(
          children: [
            ValueObserver<int>(
              valueNotifier: data,
              child: (con) => ConditionalWidget(
                condition: con != null,
                onTrue: Text("This widget show when condition is true"),
                onFalse: Text("This widget show when condition is false"),
              ),
            ),
            SpaceY(16),
            JinPlatformChecker(
              iosWidget: CupertinoButton(
                child: Text("Click"),
                onPressed: () {},
              ),
              androidWidget: RaisedButton(
                child: Text("Click"),
                onPressed: () {},
              ),
            ),
            SpaceY(24),
            MiniListTile(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              onTap: () {
                Toast.show("You click on MiniListTile", context);
              },
              leading: Icon(Icons.verified_user),
              title: Text("This is MiniListTile title"),
              subtitle: Text("This is a subtitle"),
              trailing: Icon(Icons.arrow_forward_ios),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.8),
                borderRadius: JinWidget.radius(8),
              ),
            ),
            SpaceY(24),
            ValueObserver(
              valueNotifier: count,
              child: (value) {
                return Text("You have click $value time");
              },
            ),
            SpaceY(24),
            Text(
              Duration(minutes: 3, seconds: 32, milliseconds: 245)
                  .formatDuration(hasMillisecond: true),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          count.value++;
          data.value = data.value != null ? null : count.value;
        },
      ),
    );
  }
}
