import 'package:flutter/cupertino.dart';

mixin AfterBuildMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      afterBuild(context);
    });
    super.initState();
  }

  void afterBuild(BuildContext context);
}
