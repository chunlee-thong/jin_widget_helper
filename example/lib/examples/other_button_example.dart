import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class OtherButtonExample extends StatefulWidget {
  @override
  _OtherButtonExampleState createState() => _OtherButtonExampleState();
}

class _OtherButtonExampleState extends State<OtherButtonExample> {
  final isLoading = ValueNotifier<bool>(false);

  @override
  void dispose() {
    isLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomBackButton(
              header: "Header",
              //icon: Icon(Icons.arrow_back_ios),
              headerAlignment: Alignment.centerLeft,
              backgroundColor: Colors.lightBlueAccent,
            ),
            SpaceY(),
            buildButtonCategory(
              name: "Small Icon Button",
              buttons: [
                SmallIconButton(
                  icon: Icon(Icons.add_a_photo_rounded, color: Colors.white),
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  onTap: () {},
                  backgroundColor: Colors.orangeAccent,
                ),
                SmallIconButton(
                  icon: Icon(Icons.add_alarm_rounded),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  onTap: () {},
                ),
              ],
            ),
            buildButtonCategory(
              name: "Small Flat Button",
              buttons: [
                SmallFlatButton(
                  icon: Icon(Icons.add_a_photo_rounded, color: Colors.white),
                  child: Text("Click me"),
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  textColor: Colors.white,
                  onTap: () {},
                  backgroundColor: Colors.lightGreen,
                ),
                SmallFlatButton(
                  child: Text("No Icon"),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  onTap: () {},
                ),
              ],
            ),
            buildButtonCategory(
              name: "Badge Button",
              buttons: [
                BadgeButton(
                  icon: Icon(Icons.notifications, color: Colors.blue),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  onTap: () {},
                  badgeText: "10",
                  showBadge: true,
                  badgeColor: Colors.red,
                )
              ],
            ),
            buildButtonCategory(
              name: "Action Button",
              buttons: [
                ActionButton(
                  loadingNotifier: isLoading,
                  icon: Icon(Icons.notifications, color: Colors.white),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  onPressed: () async {
                    isLoading.value = true;
                    await Future.delayed(Duration(seconds: 2));
                    isLoading.value = false;
                  },
                  child: Text("Click me"),
                  color: Colors.red,
                  textColor: Colors.white,
                  fullWidth: false,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonCategory({String name, List<Widget> buttons}) {
    return Column(
      children: [
        Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        SpaceY(),
        Row(
          children: buttons.map((button) => Flexible(child: button)).toList(),
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        Divider(),
      ],
    );
  }
}
