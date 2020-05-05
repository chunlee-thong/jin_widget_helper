import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UIHelper {
  ///Create a sizedBox with set height
  static Widget verticalSpace([double height = 8]) {
    return SizedBox(height: height);
  }

  ///Create a sizedBox with set width
  static Widget horizontalSpace([double width = 8]) {
    return SizedBox(width: width);
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  static RoundedRectangleBorder roundRect([double radius = 8]) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }
}
