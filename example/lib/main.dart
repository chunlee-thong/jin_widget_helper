import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jin Widget Helper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
    setState(() {
      stretch = !stretch;
    });
  }

  void _onIncrement() async {
    await Future.delayed(Duration(seconds: 1));
    streamController.add(_counter++);
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jin Widget Helper Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ActionButton(
              stretch: stretch,
              isLoading: isLoading,
              onPressed: onButtonClick,
              child: Text("Click me"),
              shape: StadiumBorder(),
            ),
            WidgetHelper.verticalSpace(16),
            Text("You click the button: "),
            WidgetHelper.verticalSpace(16),
            StreamHandler(
              stream: streamController.stream,
              ready: (number) {
                return Text("$number");
              },
            ),
            WidgetHelper.verticalSpace(16),
            SmallIconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Colors.cyan,
              onTap: _onIncrement,
            ),
            WidgetHelper.verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
