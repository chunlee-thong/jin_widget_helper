import 'package:flutter/material.dart';

enum DotAlignment { Top, Bottom }

class DotTabIndicator extends Decoration {
  ///radius for your dot
  final double radius;

  ///dot color
  final Color color;

  ///[DotAlignment] wether it's bottom or top of tab's label
  final DotAlignment dotAlignment;

  DotTabIndicator({
    @required this.color,
    this.radius = 4,
    this.dotAlignment = DotAlignment.Bottom,
  });
  @override
  BoxPainter createBoxPainter([void Function() onChanged]) {
    return _DotTabIndicatorPainter(
      onChanged,
      radius,
      color,
      dotAlignment,
    );
  }
}

class _DotTabIndicatorPainter extends BoxPainter {
  final double radius;
  final Color color;
  final DotAlignment dotAlignment;
  _DotTabIndicatorPainter(
    VoidCallback onChanged,
    this.radius,
    this.color,
    this.dotAlignment,
  ) : super(onChanged);
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final double yOffset = dotAlignment == DotAlignment.Bottom
        ? configuration.size.height - radius * 2
        : radius * 2;

    final Offset circleOffset = offset +
        Offset(
          configuration.size.width / 2,
          yOffset,
        );

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(circleOffset, radius, paint);
  }
}
