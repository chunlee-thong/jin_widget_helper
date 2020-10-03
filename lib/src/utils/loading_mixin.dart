import 'package:flutter/cupertino.dart';

mixin LoadingMixin<T extends StatefulWidget> on State<T> {
  ValueNotifier<bool> loadingNotifier;

  void toggleLoading() {
    loadingNotifier.value = !loadingNotifier.value;
  }

  @override
  void initState() {
    loadingNotifier = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    loadingNotifier.dispose();
    super.dispose();
  }
}
