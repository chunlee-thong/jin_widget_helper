import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'new_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jin Widget Helper',
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

  void onButtonClick() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    isLoading.value = false;
    PageNavigator.push(context, NewPage());
  }

  void _onIncrement() async {
    streamController.add(null);
    await Future.delayed(Duration(seconds: 2));
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
        reactToConnectionChange: true,
        onConnectionChange: (value) {
          print("Connection result: $value");
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
              header: "Jin Widget Helper",
              marginLeft: 8,
            ),
            JinWidget.verticalSpace(16),
            //date format extension
            Text(
                "Today date is ${DateTime.now().formatToLocalDate("dd MMMM yyyy hh:mm a")}"),
            JinWidget.verticalSpace(16),
            //action button
            ActionButton(
              stretch: stretch,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              loadingColor: Colors.white,
              color: JinColorUtils.getColorFromCode("03e2ff"),
              isLoading: isLoading,
              icon: Icon(Icons.add),
              onPressed: onButtonClick,
              child: Text("View new page"),
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
            MiniListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    JinUtils.randomCategoryStringImage(category: "cat")),
              ),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
              ),
              title: Text(
                  "This is a long mini listitle title that make check if it can be overflow"),
              subtitle: Text("subtitle"),
              trailing: Checkbox(
                onChanged: (value) {},
                value: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //general message dialog
          showDialog(
            context: context,
            builder: (context) => JinSimpleDialog(
              content: "Nice",
            ),
          );
        },
        child: Icon(Icons.slideshow),
      ),
    );
  }
}
