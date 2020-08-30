import 'package:flutter/material.dart';

class JinNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static get getContext => navigatorKey.currentState.overlay.context;

  ///Push the navigator to widget's route
  static Future push<T>(Widget page, {bool fullsreenDialog = false}) async {
    return await Navigator.of(getContext).push<T>(MaterialPageRoute(
      builder: (context) => page,
      fullscreenDialog: fullsreenDialog,
    ));
  }

  ///short handed push replacement navigator
  static Future pushReplacement(Widget page,
      {bool fullsreenDialog = false}) async {
    return await Navigator.of(getContext).pushReplacement(MaterialPageRoute(
      builder: (context) => page,
      fullscreenDialog: fullsreenDialog,
    ));
  }

  ///short handed push and remove navigator
  static Future pushAndRemove(Widget page) async {
    return await Navigator.of(getContext).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (_) => false,
    );
  }

  ///show a dialog
  static Future<T> dialog<T>(Widget dialog, {bool barrierDismissable}) async {
    return await showDialog<T>(
      context: getContext,
      barrierDismissible: barrierDismissable,
      builder: (context) => dialog,
    );
  }
}
