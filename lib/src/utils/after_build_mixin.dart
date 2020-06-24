import 'package:flutter/cupertino.dart';

mixin WidgetDidMount<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widgetBuilt(context);
    });
    super.initState();
  }

  void widgetBuilt(BuildContext context);
}
