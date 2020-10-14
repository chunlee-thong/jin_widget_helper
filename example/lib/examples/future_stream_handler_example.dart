import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:rxdart/rxdart.dart';

class FutureAndStreamHandlerExample extends StatefulWidget {
  FutureAndStreamHandlerExample({Key key}) : super(key: key);
  @override
  _FutureAndStreamHandlerExampleState createState() =>
      _FutureAndStreamHandlerExampleState();
}

class _FutureAndStreamHandlerExampleState
    extends State<FutureAndStreamHandlerExample> {
  BehaviorSubject<int> numberController = BehaviorSubject();
  Future<int> numberFuture;

  Future<int> fetchMyNumber() async {
    await Future.delayed(Duration(seconds: 3));
    int myValue = await Future.value(10);
    bool error = Random().nextBool();
    if (error) {
      numberController.addError("We got an error here");
      throw "Sorry we got an errror";
    } else {
      numberController.add(myValue);
      return myValue;
    }
  }

  @override
  void initState() {
    numberFuture = fetchMyNumber();
    super.initState();
  }

  @override
  void dispose() {
    numberController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FutureHandler and StreamHandler"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                numberFuture = fetchMyNumber();
              });
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 32),
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: FutureHandler<int>(
                future: numberFuture,
                loading: Text("Loading..."),
                error: (error) => Text(error.toString()),
                ready: (int data) {
                  return Text("This is my value: $data");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: StreamHandler<int>(
                stream: numberController.stream,
                onError: (error) {
                  print(error.toString());
                },
                loading: CircularProgressIndicator(),
                error: (error) => Column(
                  children: [
                    Icon(Icons.error),
                    SpaceY(),
                    Text(error.toString()),
                  ],
                ),
                ready: (int data) {
                  return Text("This is my value: $data");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
