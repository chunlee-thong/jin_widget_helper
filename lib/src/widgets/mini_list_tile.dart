import 'package:flutter/material.dart';
import 'package:jin_widget_helper/src/widgets/spacing.dart';

class MiniListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;
  final Function onTap;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Decoration decoration;
  final CrossAxisAlignment aligment;
  final Widget separator;

  ///A custom listtile for simple customization
  const MiniListTile({
    Key key,
    this.leading,
    this.title,
    this.subtitle,
    this.decoration,
    this.onTap,
    this.trailing,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.all(0.0),
    this.aligment,
    this.separator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final titleWidget = DefaultTextStyle(
      style: Theme.of(context).textTheme.subtitle1,
      child: title ?? const SizedBox(),
    );

    final subTitleWidget = DefaultTextStyle(
      style:
          Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.black54),
      child: subtitle ?? const SizedBox(),
    );

    final trailingWidget = DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2,
      child: trailing ?? const SizedBox(),
    );

    return Container(
      decoration: decoration,
      margin: margin,
      child: Column(
        children: [
          InkWell(
            onTap: onTap ?? null,
            child: Padding(
              padding: padding,
              child: Row(
                crossAxisAlignment: aligment ?? CrossAxisAlignment.center,
                children: <Widget>[
                  if (leading != null) ...[
                    leading,
                    SpaceX(16),
                  ],
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        titleWidget,
                        if (subtitle != null) SpaceX(4),
                        subTitleWidget,
                      ],
                    ),
                  ),
                  SpaceX(),
                  Flexible(
                    flex: 0,
                    child: trailingWidget,
                    fit: FlexFit.loose,
                  ),
                ],
              ),
            ),
          ),
          if (separator != null) separator,
        ],
      ),
    );
  }
}
