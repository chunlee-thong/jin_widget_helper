import 'package:flutter/material.dart';

import '../../jin_widget_helper.dart';

class JinMediaCard extends StatelessWidget {
  final double width;

  final double height;

  ///Card padding
  final EdgeInsets padding;

  ///Card margin
  final EdgeInsets margin;

  ///Card boxDecoration
  final BoxDecoration decoration;

  ///[MediaBuilder] widget, usually Image Widget, required [Width]
  final MediaBuilder mediaBuilder;

  ///Space between [MediaBuilder] and [infoBuilder]
  final double mainAxisSpacing;

  ///Alignment of [MediaBuilder] and[infoBuilder]
  final Axis alignment;

  ///Widget that represent in info
  final Widget infoBuilder;

  ///Card elevation
  final double elevation;

  ///OnTap callback
  final VoidCallback onTap;

  final int mediaFlexSize;

  const JinMediaCard({
    Key key,
    @required this.height,
    @required this.mediaBuilder,
    @required this.infoBuilder,
    this.padding = const EdgeInsets.all(8.0),
    this.margin = const EdgeInsets.all(0.0),
    this.decoration,
    this.alignment = Axis.horizontal,
    this.mainAxisSpacing = 8.0,
    this.elevation = 2.0,
    this.onTap,
    this.width,
    this.mediaFlexSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BoxDecoration containerDecoration = decoration ??
        BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        );

    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: containerDecoration,
      child: Material(
        elevation: elevation,
        borderRadius: containerDecoration.borderRadius,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: containerDecoration.borderRadius,
          ),
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: alignment == Axis.horizontal
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mediaBuilder,
                      SpaceX(mainAxisSpacing),
                      Flexible(child: infoBuilder),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mediaBuilder,
                      SpaceY(mainAxisSpacing),
                      infoBuilder,
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class MediaBuilder extends StatelessWidget {
  final double width;

  final double height;

  ///Background color for this widget
  final Color color;

  ///BorderRadius for this widget
  final BorderRadius radius;
  final Widget child;
  const MediaBuilder({
    Key key,
    @required this.width,
    @required this.child,
    this.height,
    this.color = Colors.transparent,
    this.radius = BorderRadius.zero,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: radius,
      ),
      alignment: Alignment.center,
      child: SizedBox.expand(child: child),
    );
  }
}
