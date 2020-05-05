import 'package:flutter/material.dart';

class StreamHandler<T> extends StatelessWidget {
  final Stream stream;
  final Widget Function(T) ready;
  final Widget loading;
  final T initialData;
  final Widget Function(String) error;

  ///create a streambuilder that for less boilerplate code
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
          return Center(child: loading ?? CircularProgressIndicator());
        }
      },
    );
  }
}
