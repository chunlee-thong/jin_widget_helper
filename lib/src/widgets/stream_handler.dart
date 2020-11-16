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

  ///A function call when stream has an error
  final void Function(dynamic) onError;

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
  StreamSubscription<T> subscription;
  @override
  void initState() {
    if (widget.onError != null) {
      subscription = widget.stream.asBroadcastStream().listen((data) {});
      subscription.onError((error) => widget.onError(error));
    }
    super.initState();
  }

  @override
  void dispose() {
    if (subscription != null) {
      subscription.cancel();
      subscription = null;
    }
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
          if (widget.error != null) return widget.error(snapshot.error);
          return Center(
            child: Text(
              snapshot.error.toString(),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          if (widget.loading != null) return widget.loading;
          return Center(child: JinWidget.platformLoadingWidget());
        }
      },
    );
  }
}
