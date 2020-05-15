import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class MiniListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;
  final Function onTap;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Decoration decoration;

  ///A custom listtile for simple customization
  const MiniListTile(
      {Key key,
      this.leading,
      this.title,
      this.subtitle,
      this.decoration,
      this.onTap,
      this.trailing,
      this.padding = const EdgeInsets.all(8),
      this.margin = const EdgeInsets.all(8)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final titleWidget = DefaultTextStyle(
      style: Theme.of(context).textTheme.subtitle1,
      child: title ?? const SizedBox(),
    );

    final subTitleWidget = DefaultTextStyle(
      style: Theme.of(context).textTheme.caption,
      child: subtitle ?? const SizedBox(),
    );

    final trailingWidget = DefaultTextStyle(
      style: Theme.of(context).textTheme.caption,
      child: trailing ?? const SizedBox(),
    );

    return Container(
      decoration: decoration,
      margin: margin,
      child: InkWell(
        onTap: onTap ?? null,
        child: Padding(
          padding: padding,
          child: Row(
            crossAxisAlignment: subtitle == null
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: <Widget>[
              leading ?? const SizedBox(),
              if (leading != null) UIHelper.horizontalSpace(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  titleWidget,
                  UIHelper.verticalSpace(4),
                  subTitleWidget,
                ],
              ),
              Spacer(),
              trailingWidget,
            ],
          ),
        ),
      ),
    );
  }
}
