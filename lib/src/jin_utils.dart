import 'dart:io';
import 'dart:math';

import 'dart:typed_data';

import 'dart:ui';

import 'package:flutter/services.dart';

///Convert degreen to radian because most of Flutter's Widget depends on Radian
class JinUtils {
  static double degreeToRadian(double degree) {
    return degree * (-pi / 180);
  }

  ///A Function to check network connection
  static Future<bool> checkConnection() async {
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

  ///get bytes from asset that mostly use for google map marker
  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  ///get A random Image from Picsum with given dimension
  static String randomStringImage([int dimension = 200]) {
    return "https://picsum.photos/$dimension";
  }
}
