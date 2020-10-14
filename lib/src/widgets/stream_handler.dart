import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/src/utils/jin_widget.dart';

class StreamHandler<T> extends StatefulWidget {
  final Stream stream;

  ///A callback when Stream's snapshot hasData
  final Widget Function(T) ready;

  ///A widgeting showing when stream's has no data
  final Widget loading;

  ///stream initial data
  final T initialData;

  ///On snapshot error callback
  final Widget Function(dynamic) error;

  final Function(dynamic) onError;

  ///create a streambuilder with less boilerplate code
  const StreamHandler({
    @required this.stream,
    @required this.ready,
    this.error,
    this.onError,
    this.loading,
    this.initialData,
  });

  @override
  _StreamHandlerState<T> createState() => _StreamHandlerState<T>();
}

class _StreamHandlerState<T> extends State<StreamHandler<T>> {
  StreamSubscription subscription;
  @override
  void initState() {
    if (widget.onError != null) {
      widget.stream.asBroadcastStream().listen((data) {}, onError: (error) {
        widget.onError(error);
      });
      //subscription.onError();
    }
    super.initState();
  }

  @override
  void dispose() {
    if (subscription != null) subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: widget.stream,
      initialData: widget.initialData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return widget.ready(snapshot.data);
        } else if (snapshot.hasError) {
          if (widget.error != null)
            return Center(
              child: widget.error(snapshot.error),
            );
          return Center(
            child: Text(
              snapshot.error.toString(),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return Center(
              child: widget.loading ?? JinWidget.platformLoadingWidget());
        }
      },
    );
  }
}
