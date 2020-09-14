import 'package:flutter/material.dart';

class JinNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static get getContext => navigatorKey.currentState.overlay.context;

  ///pop the current route
  static void pop<T>([T result]) {
    Navigator.of(getContext).pop(result);
  }

  ///Push the navigator to widget's route
  static Future push<T>(Widget page, {bool fullsreenDialog = false}) async {
    return await Navigator.of(getContext).push<T>(MaterialPageRoute(
      builder: (context) => page,
      fullscreenDialog: fullsreenDialog,
    ));
  }

  static Future pushNamed<T>(String name, {Object argument}) async {
    return await Navigator.of(getContext)
        .pushNamed<T>(name, arguments: argument);
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
  static Future<T> dialog<T>(Widget dialog,
      {bool barrierDismissable = true}) async {
    return await showDialog<T>(
      context: getContext,
      barrierDismissible: barrierDismissable,
      builder: (context) => dialog,
    );
  }
}
