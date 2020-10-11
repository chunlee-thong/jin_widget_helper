import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/src/utils/jin_widget.dart';

class StreamHandler<T> extends StatelessWidget {
  final Stream stream;

  ///A callback when Stream's snapshot hasData
  final Widget Function(T) ready;

  ///A widgeting showing when stream's has no data
  final Widget loading;

  ///stream initial data
  final T initialData;

  ///On snapshot error callback
  final Widget Function(String) error;

  ///create a streambuilder with less boilerplate code
  const StreamHandler({
    @required this.stream,
    @required this.ready,
    this.error,
    this.loading,
    this.initialData,
  });
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: stream,
      initialData: initialData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ready(snapshot.data);
        } else if (snapshot.hasError) {
          if (error != null)
            return Center(
              child: error(snapshot.error),
            );
          return Center(
            child: Text(
              snapshot.error.toString(),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return Center(child: loading ?? JinWidget.platformLoadingWidget());
        }
      },
    );
  }
}
