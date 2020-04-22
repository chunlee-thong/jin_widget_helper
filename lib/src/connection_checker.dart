import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ConnectionChecker extends StatefulWidget {
  final Widget child;
  final String message;
  final Function(bool) onConnectionChange;
  final bool reactToConnectionChange;
  final Widget Function(String) onNoInternet;

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

  void checkConnectionStream() async {
    try {
      bool connection = await checkConnection();
      if (widget.onConnectionChange != null) {
        await widget.onConnectionChange(connection);
      }
      connectionStream.add(connection);
    } catch (e) {
      connectionStream.addError(e.toString());
    }
  }

  Future<bool> checkConnection() async {
    print("Check connection");
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    checkConnectionStream();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (widget.reactToConnectionChange) {
        print("Conneciton Result ${result.toString()}");
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
    Widget child;
    if (widget.onNoInternet != null) {
      child = widget.onNoInternet(widget.message);
    } else {
      child = Text(widget.message);
    }
    return Container(
      child: StreamBuilder<bool>(
        stream: connectionStream.stream,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) return widget.child;
            return Center(child: child);
          } else if (snapshot.hasError) {
            return Center(child: child);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
