import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../jin_widget_helper.dart';

class StreamHandler<T> extends StatelessWidget {
  final Stream stream;

  ///A callback when Future's snapshot hasData
  final Widget Function(T) ready;
  final Widget loading;
  final T initialData;

  ///On snapshot error callback
  final Widget Function(String) error;

  ///create a streambuilder with less boilerplate code
  const StreamHandler(
      {@required this.stream,
      @required this.ready,
      this.error,
      this.loading,
      this.initialData});
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
            return Center(child: error(snapshot.error.toString()));
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return Center(child: loading ?? UIHelper.loadingChild);
        }
      },
    );
  }
}
