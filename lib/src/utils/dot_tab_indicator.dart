import 'package:flutter/material.dart';

class DotTabIndicator extends Decoration {
  final double radius;
  final Color color;

  DotTabIndicator({this.radius = 8, this.color});
  @override
  BoxPainter createBoxPainter([void Function() onChanged]) {
    return _DotTabIndicatorPainter(
      onChanged,
      radius,
      color,
    );
  }
}

class _DotTabIndicatorPainter extends BoxPainter {
  final double radius;
  final Color color;
  _DotTabIndicatorPainter(VoidCallback onChanged, this.radius, this.color)
      : super(onChanged);
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Offset circleOffset = offset +
        Offset(configuration.size.width / 2,
            configuration.size.height - radius * 2);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.square;
    canvas.drawCircle(circleOffset, radius, paint);
  }
}
