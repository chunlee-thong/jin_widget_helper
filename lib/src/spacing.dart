import 'package:flutter/cupertino.dart';

class SpaceX extends StatelessWidget {
  final double width;
  const SpaceX([this.width = 8]);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class SpaceY extends StatelessWidget {
  final double height;
  const SpaceY([this.height = 8]);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
