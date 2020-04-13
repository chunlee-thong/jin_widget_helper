import 'package:flutter/material.dart';

class PageNavigator {
  ///short handed push navigator
  static Future push<T>(BuildContext context, Widget page) async {
    return await Navigator.of(context).push<T>(MaterialPageRoute(builder: (context) => page));
  }

  ///short handed push replacement navigator
  static Future pushReplacement(BuildContext context, Widget page) async {
    return await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => page));
  }

  ///short handed push and remove navigator
  static Future pushAndRemove(BuildContext context, Widget page) async {
    return await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (dynamic) => false,
    );
  }
}
