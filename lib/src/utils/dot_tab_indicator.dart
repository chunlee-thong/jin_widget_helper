import 'package:flutter/material.dart';

enum TabAlignment { top, bottom }

class DotTabIndicator extends Decoration {
  ///radius for your dot
  final double radius;

  ///dot color
  final Color color;

  ///[TabAlignment] wether it's bottom or top of tab's label
  final TabAlignment tabAlignment;

  DotTabIndicator({
    @required this.color,
    this.radius = 4,
    this.tabAlignment = TabAlignment.bottom,
  }) : assert(color != null);
  @override
  BoxPainter createBoxPainter([void Function() onChanged]) {
    return _DotTabIndicatorPainter(
      onChanged,
      radius,
      color,
      tabAlignment,
    );
  }
}

class _DotTabIndicatorPainter extends BoxPainter {
  final double radius;
  final Color color;
  final TabAlignment tabAlignment;
  _DotTabIndicatorPainter(
    VoidCallback onChanged,
    this.radius,
    this.color,
    this.tabAlignment,
  ) : super(onChanged);
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final double yOffset = tabAlignment == TabAlignment.bottom
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
