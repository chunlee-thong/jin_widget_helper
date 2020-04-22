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
        primarySwatch: ColorUtils.hexColorToMaterialColor(0xff08f7ff),
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
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConnectionChecker(
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
            CustomBackButton(
              onTap: () {},
              header: "Jin Widget Helper",
              marginLeft: 8,
            ),
            UIHelper.verticalSpace(16),
            Text(
                "Today date is ${DateTime.now().formatToLocalDate(format: "dd MMMM yyyy hh:mm a")}"),
            UIHelper.verticalSpace(16),
            ActionButton(
              stretch: stretch,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              loadingColor: Colors.white,
              color: ColorUtils.getColorFromCode(code: "03e2ff"),
              isLoading: isLoading,
              onPressed: onButtonClick,
              child: Text("Open New Screen"),
              shape: StadiumBorder(),
            ),
            UIHelper.verticalSpace(16),
            StreamHandler<int>(
              stream: streamController.stream,
              initialData: _counter,
              loading: Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, _) {
                return Text(error);
              },
              ready: (number) {
                return Column(
                  children: <Widget>[
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
            UIHelper.verticalSpace(32),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => GeneralMessageDialog(
              content: "Nice",
            ),
          );
        },
        child: Icon(Icons.slideshow),
      ),
    );
  }
}