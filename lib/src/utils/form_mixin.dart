import 'package:flutter/cupertino.dart';

mixin FormPageMixin<T extends StatefulWidget> on State<T> {
  final formKey = GlobalKey<FormState>();
  final loadingNotifier = ValueNotifier<bool>(false);

  void toggleLoading() {
    loadingNotifier.value = !loadingNotifier.value;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    loadingNotifier.dispose();
    super.dispose();
  }
}

extension LoadingExtension on Function {
  Future<void> indicateLoading(
      {@required ValueNotifier<bool> loadingNotifier,
      Function(String) onError}) async {
    try {
      loadingNotifier.value = true;
      await this();
    } catch (e) {
      onError(e.toString());
    } finally {
      loadingNotifier.value = false;
    }
  }
}
