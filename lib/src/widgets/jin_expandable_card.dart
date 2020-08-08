import 'package:flutter/material.dart';

///A widget that provide that can hide bottomContent
class JinExpandableCard extends StatefulWidget {
  final Widget topChild;
  final Widget bottomChild;
  final Duration duration;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Curve curve;
  final bool isExpand;
  final Color color;
  final double elevation;
  const JinExpandableCard({
    Key key,
    @required this.topChild,
    @required this.bottomChild,
    this.isExpand = false,
    this.duration = const Duration(milliseconds: 200),
    this.padding = const EdgeInsets.all(16),
    this.curve = Curves.linear,
    this.margin = EdgeInsets.zero,
    this.color,
    this.elevation = 2.0,
  }) : super(key: key);
  @override
  _JinExpandableCardState createState() => _JinExpandableCardState();
}

class _JinExpandableCardState extends State<JinExpandableCard>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> size;

  void toggle() {
    if (controller.isAnimating) {
    } else if (controller.isCompleted) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: widget.duration);
    size = CurvedAnimation(curve: widget.curve, parent: controller);
    if (widget.isExpand) controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(JinExpandableCard oldWidget) {
    if (widget.isExpand != oldWidget.isExpand) toggle();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: widget.margin,
      elevation: widget.elevation,
      color: widget.color,
      child: InkWell(
        onTap: toggle,
        child: Padding(
          padding: widget.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              widget.topChild,
              SizeTransition(
                child: widget.bottomChild,
                sizeFactor: size,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
