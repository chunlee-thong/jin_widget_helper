import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

import '../../jin_widget_helper.dart';

class ConnectionChecker extends StatefulWidget {
  final Widget child;

  ///A message showing when there's no internet
  final String message;

  ///A function trigger when your connection status change
  final Function(bool) onConnectionChange;

  ///Tell the widget wether to call [onConnectionChange] when connection chnage
  final bool reactToConnectionChange;

  ///A Callback function that return a Widget with [message] when there's no internet connection
  final Widget Function(String) onNoInternet;

  ///A widget to check your connection and display a Widget when there's no internet connection
  const ConnectionChecker({
    Key key,
    this.child,
    this.reactToConnectionChange = true,
    this.onConnectionChange,
    this.onNoInternet,
    this.message = "No internet connection",
  }) : super(key: key);
  @override
  _ConnectionCheckerState createState() => _ConnectionCheckerState();
}

class _ConnectionCheckerState extends State<ConnectionChecker> {
  StreamController<bool> connectionStream = StreamController();
  StreamSubscription subscription;
  Connectivity connectivity = Connectivity();

  void checkConnectionStream() async {
    try {
      bool connection = await JinUtils.checkConnection();
      await widget.onConnectionChange?.call(connection);
      connectionStream.add(connection);
    } catch (e) {
      connectionStream.addError(e);
    }
  }

  @override
  void initState() {
    checkConnectionStream();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      //only check connection when widget is react to connectivity change
      if (widget.reactToConnectionChange) {
        checkConnectionStream();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    if (subscription != null) subscription.cancel();
    connectionStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget noInternetWidget;
    if (widget.onNoInternet != null) {
      noInternetWidget = widget.onNoInternet(widget.message);
    } else {
      noInternetWidget = Text(
        widget.message,
        textAlign: TextAlign.center,
      );
    }
    return StreamBuilder<bool>(
      stream: connectionStream.stream,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data) return widget.child;
          return Center(child: noInternetWidget);
        } else if (snapshot.hasError) {
          return Center(child: noInternetWidget);
        } else {
          return Center(child: JinWidget.platformLoadingWidget());
        }
      },
    );
  }
}
