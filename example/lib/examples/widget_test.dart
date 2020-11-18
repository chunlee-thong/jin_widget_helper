import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class WidgetTestExample extends StatefulWidget {
  @override
  _WidgetTestExampleState createState() => _WidgetTestExampleState();
}

class _WidgetTestExampleState extends State<WidgetTestExample>
    with LoadingMixin, SingleTickerProviderStateMixin {
  Future<void> onButtonPressed() async {
    toggleLoading();
    await Future.delayed(Duration(seconds: 2));
    toggleLoading();
  }

  TabController tabController;
  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(fontSize: 12);
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget test"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionButton(
                  fullWidth: false,
                  icon: Icon(Icons.add),
                  shape: JinWidget.roundRect(4),
                  child: Text(
                    "Hello",
                    style: style,
                  ),
                  onPressed: onButtonPressed,
                  loadingNotifier: loadingNotifier,
                ),
                SpaceX(24),
                JinLoadingButton(
                  fullWidth: false,
                  startIcon: Icon(Icons.add),
                  child: Text(
                    "Hello",
                    style: style,
                  ),
                  onPressed: onButtonPressed,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: TabBar(
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.black,
        indicator: DotTabIndicator(
          color: Colors.blue,
          dotAlignment: DotAlignment.Bottom,
        ),
        controller: tabController,
        tabs: [
          Tab(text: "Car"),
          Tab(text: "MotorCycle"),
          Tab(text: "Ship Container"),
        ],
      ),
    );
  }
}
