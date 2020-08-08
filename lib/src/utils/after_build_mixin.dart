import 'package:flutter/cupertino.dart';

mixin AfterBuildMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      afterBuild(context);
    });
    super.initState();
  }

  ///this method will run after widget tree has been built
  void afterBuild(BuildContext context);
}
