import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:jin_widget_helper_example/another_page.dart';
import 'new_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jin Widget Helper',
      navigatorKey: JinNavigator.navigatorKey,
      theme: ThemeData(
        primarySwatch: JinColorUtils.hexColorToMaterialColor(0xff08f7ff),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool stretch = true;
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  StreamController<int> streamController = StreamController.broadcast();
  int _counter = 0;
  final listTileSelected = false.obs<bool>();

  void onButtonClick() async {
    isLoading.value = true;
    await Future.delayed(Duration(milliseconds: 2000));
    isLoading.value = false;
    JinNavigator.push(NewPage());
  }

  void _onIncrement() async {
    streamController.add(null);
    await Future.delayed(Duration(milliseconds: 200));
    _counter += 1;
    streamController.add(_counter);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectionChecker(
        reactToConnectionChange: false,
        onConnectionChange: (value) {
          print("On Connection change: $value");
        },
        onNoInternet: (message) {
          return FlatButton.icon(
            icon: Icon(Icons.error),
            label: Text(message),
            onPressed: () {},
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //custom back button with header
            CustomBackButton(
              onTap: () {},
              headerAlignment: Alignment.centerLeft,
              header: "Jin Widget Helper",
            ),
            JinWidget.verticalSpace(16),
            //date format extension
            Text(
                "Today date is ${DateTime.now().formatToLocalDate("dd MMMM yyyy hh:mm a")}"),
            JinWidget.verticalSpace(16),
            //action button
            ActionButton(
              stretch: false,
              loadingColor: Colors.white,
              color: JinColorUtils.getColorFromCode("03e2ff"),
              isLoading: isLoading,
              icon: Icon(Icons.add),
              onPressed: onButtonClick,
              child: Text("View Form Validation Page"),
              shape: StadiumBorder(),
            ),
            JinWidget.verticalSpace(16).cssSpacing(margin: [0, 16]),
            //streamhandler
            StreamHandler<int>(
              stream: streamController.stream,
              initialData: _counter,
              error: (error) => Text(error),
              ready: (number) {
                return Column(
                  children: <Widget>[
                    //badge button
                    BadgeButton(
                      icon: Icon(Icons.notifications_active),
                      badgeColor: Colors.red,
                      badgeText: "$_counter",
                      onTap: () {
                        _counter = 0;
                        streamController.add(_counter);
                      },
                      showBadge: _counter != 0,
                    ),
                    Text("You click the Add button $number times"),
                  ],
                );
              },
            ),
            JinWidget.verticalSpace(32),
            //small icon button
            SmallIconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              margin: EdgeInsets.zero,
              borderRadius: 16,
              elevation: 1.0,
              backgroundColor: Theme.of(context).primaryColor,
              onTap: _onIncrement,
            ),
            JinWidget.verticalSpace(32),
            //Mini listtile
            ValueObserver<bool>(
              valueNotifier: listTileSelected,
              child: (selected) => MiniListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      JinUtils.randomCategoryStringImage(category: "cat")),
                ),
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                ),
                title: ConditionalWidget(
                  condition: selected,
                  onTrue: Text(
                    "This is a long mini listitle title that use to check if it can be overflow",
                  ),
                  onFalse: Text("Title has been hidden"),
                ),
                subtitle: Text("Click the checkbox to show or hide title"),
                trailing: Checkbox(
                  onChanged: (value) {
                    listTileSelected.value = value;
                  },
                  value: selected,
                ),
              ),
            ),
            SmallFlatButton(
              child: Text("Small Flat Button"),
              icon: Icon(Icons.refresh),
              onTap: () {
                JinNavigator.push(AnotherPage());
              },
              textColor: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.red,
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.black12,
              ),
              child: Text("Padding value and Margin Value")
                  .paddingValue(horizontal: 16, vertical: 8),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RaisedButton(
            color: Colors.deepOrange,
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () {
              JinNavigator.dialog(
                  JinSimpleDialog(content: "Hello from my dialog"));
            },
            child: Text("Simple dialog"),
          ),
          RaisedButton(
            color: Colors.deepOrange,
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () {
              JinNavigator.dialog(
                JinConfirmationDialog(
                  content: Text("Are you sure you want to delete this?"),
                  onCancel: () => print("Cancel option"),
                  onConfirm: () => print("confirm option"),
                ),
              );
            },
            child: Text("Confirmation dialog"),
          ),
        ],
      ),
    );
  }
}
