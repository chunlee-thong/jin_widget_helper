import 'dart:io';

import 'package:flutter/material.dart';

class JinPlatformChecker extends StatelessWidget {
  final Widget androidWidget;
  final Widget iosWidget;

  const JinPlatformChecker(
      {Key key, @required this.androidWidget, this.iosWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildPlatformChecker();
  }

  Widget buildPlatformChecker() {
    if (iosWidget != null) {
      return Platform.isIOS || Platform.isMacOS ? iosWidget : androidWidget;
    }
    return androidWidget;
  }
}
