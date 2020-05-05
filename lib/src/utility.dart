import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';

double degreeToRadian(double degree) {
  return degree * (-pi / 180);
}

Future<bool> checkConnection() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}

String randomStringImage([int dimension = 200]) {
  return "https://picsum.photos/$dimension";
}
