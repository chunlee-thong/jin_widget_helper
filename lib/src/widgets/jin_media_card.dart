import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class JinMediaCard extends StatelessWidget {
  ///Card height with provide [screenSize] as paramater
  final double Function(Size screenSize) height;

  ///Card Width with provide [screenSize] as paramater
  final double Function(Size screenSize) width;

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
    final size = MediaQuery.of(context).size;
    final BoxDecoration containerDecoration = decoration ??
        BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        );

    return Container(
      margin: margin,
      height: height?.call(size),
      width: width?.call(size) ?? size.width,
      decoration: containerDecoration,
      child: Material(
        elevation: elevation,
        borderRadius: containerDecoration.borderRadius,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
              borderRadius: containerDecoration.borderRadius),
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: alignment == Axis.horizontal
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mediaBuilder,
                      SizedBox(width: mainAxisSpacing, height: 0),
                      Flexible(child: infoBuilder),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: mediaBuilder,
                        flex: mediaFlexSize ?? 1,
                      ),
                      SizedBox(height: mainAxisSpacing),
                      Flexible(
                        child: infoBuilder,
                        flex: 1,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class MediaBuilder extends StatelessWidget {
  final double Function(double screenWidth) width;
  final Color color;
  final BorderRadius radius;
  final Widget child;
  const MediaBuilder({
    Key key,
    @required this.width,
    @required this.child,
    this.color = Colors.transparent,
    this.radius = BorderRadius.zero,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: width(screenWidth),
      decoration: BoxDecoration(
        color: color,
        borderRadius: radius,
      ),
      alignment: Alignment.center,
      child: SizedBox.expand(child: child),
    );
  }
}
