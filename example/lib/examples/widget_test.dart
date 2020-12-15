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
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget test"),
      ),
      body: Column(
        children: [
          TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black,
            indicatorPadding: EdgeInsets.only(left: 24),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            indicator: SmallUnderLineTabIndicator(
              color: Colors.red,
              tabAlignment: TabAlignment.bottom,
              width: 16,
              paddingLeft: 16,
            ),
            controller: tabController,
            tabs: [
              Tab(text: "Car"),
              Tab(text: "MotorCycle"),
              Tab(text: "Ship Container"),
            ],
          ),
          Text("Hello"),
        ],
      ),
    );
  }
}
