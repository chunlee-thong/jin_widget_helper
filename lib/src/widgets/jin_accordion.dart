import 'package:flutter/material.dart';
import '../../jin_widget_helper.dart';

enum IconPosition {
  Start,
  End,
}

///Custom accordion that similar to Flutter's [ExpansionTile]
class JinAccordion extends StatefulWidget {
  final Widget title;
  final Widget icon;
  final List<Widget> children;
  final Curve curve;
  final Duration animationDuration;
  final double headerElevation;
  final Decoration headerDecoration;
  final Color childrenBackgroundColor;
  final EdgeInsets headerPadding;
  final EdgeInsets margin;
  final EdgeInsets childrenPadding;
  final Function(bool) onToggle;
  final bool initiallyExpand;
  final bool showIcon;
  final IconPosition iconPosition;

  const JinAccordion({
    Key key,
    @required this.title,
    @required this.children,
    this.margin = const EdgeInsets.all(0.0),
    this.childrenPadding = const EdgeInsets.all(12.0),
    this.icon = const Icon(Icons.keyboard_arrow_down),
    this.curve = Curves.linear,
    this.animationDuration = const Duration(milliseconds: 200),
    this.onToggle,
    this.headerPadding,
    this.headerElevation,
    this.headerDecoration,
    this.initiallyExpand = false,
    this.showIcon = true,
    this.iconPosition = IconPosition.End,
    this.childrenBackgroundColor,
  }) : super(key: key);
  @override
  _JinAccordionState createState() => _JinAccordionState();
}

class _JinAccordionState extends State<JinAccordion> with SingleTickerProviderStateMixin {
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
    controller = AnimationController(vsync: this, duration: widget.animationDuration);
    size = CurvedAnimation(curve: widget.curve, parent: controller);
    rotation = Tween<double>(begin: 0.0, end: 0.5).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final icon = RotationTransition(
      turns: rotation,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: widget.icon,
      ),
      alignment: Alignment.center,
    );
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InkWell(
            onTap: onToggle,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: widget.headerDecoration ?? BoxDecoration(),
              padding: widget.headerPadding ?? const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: widget.iconPosition == IconPosition.Start
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (widget.iconPosition == IconPosition.Start && widget.showIcon) ...[
                    icon,
                    SpaceX(),
                  ],
                  Flexible(
                    child: DefaultTextStyle.merge(
                      child: widget.title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  if (widget.iconPosition == IconPosition.End && widget.showIcon) ...[icon],
                ],
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: size,
            child: Container(
              color: widget.childrenBackgroundColor ?? null,
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
