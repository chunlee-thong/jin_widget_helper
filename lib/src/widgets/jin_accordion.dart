import 'dart:math';

import 'package:flutter/material.dart';

class JinAccordion extends StatefulWidget {
  final Widget title;
  final Widget icon;
  final List<Widget> children;
  final Curve curve;
  final Duration animationDuration;
  final double headerElevation;
  final Color headerBackgroundColor;
  final EdgeInsets titlePadding;
  final EdgeInsets margin;
  final EdgeInsets childrenPadding;
  final Function(bool) onToggle;
  final bool initiallyExpand;

  const JinAccordion({
    Key key,
    @required this.title,
    @required this.children,
    this.margin = const EdgeInsets.all(0.0),
    this.childrenPadding = const EdgeInsets.all(16.0),
    this.icon = const Icon(Icons.keyboard_arrow_down),
    this.curve = Curves.linear,
    this.animationDuration = const Duration(milliseconds: 200),
    this.onToggle,
    this.titlePadding,
    this.headerElevation,
    this.headerBackgroundColor,
    this.initiallyExpand = false,
  }) : super(key: key);
  @override
  _JinAccordionState createState() => _JinAccordionState();
}

class _JinAccordionState extends State<JinAccordion>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> size;
  Animation<double> rotation;
  bool isExpand;

  void onToggle() {
    if (controller.isAnimating) {
    } else if (controller.isCompleted) {
      controller.reverse();
      isExpand = false;
    } else {
      controller.forward();
      isExpand = true;
    }
    if (widget.onToggle != null) widget.onToggle(isExpand);
  }

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: widget.animationDuration);
    size = CurvedAnimation(curve: widget.curve, parent: controller);
    rotation = Tween<double>(begin: 0.0, end: pi / 6).animate(controller);
    isExpand = widget.initiallyExpand;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InkWell(
            onTap: onToggle,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: widget.headerBackgroundColor ?? null,
              padding: widget.titlePadding ?? const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  DefaultTextStyle.merge(
                    child: widget.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  RotationTransition(
                    turns: rotation,
                    child: widget.icon,
                  ),
                ],
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: size,
            child: Padding(
              padding: widget.childrenPadding,
              child: Column(
                children: widget.children,
                crossAxisAlignment: CrossAxisAlignment.stretch,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
