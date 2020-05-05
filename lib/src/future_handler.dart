import 'package:flutter/material.dart';

class FutureHandler<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(T) ready;
  final Widget loading;
  final T initialData;
  final Widget Function(String) error;

  ///create a futurebuilder that for less boilerplate code
  const FutureHandler(
      {@required this.future,
      @required this.ready,
      this.error,
      this.loading,
      this.initialData});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
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
