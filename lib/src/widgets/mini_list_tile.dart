import 'package:flutter/material.dart';
import 'package:jin_widget_helper/src/utils/jin_widget.dart';
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
      child: InkWell(
        onTap: onTap ?? null,
        child: Padding(
          padding: padding,
          child: Row(
            crossAxisAlignment: subtitle == null
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.center,
            children: <Widget>[
              if (leading != null) ...[
                leading,
                JinWidget.horizontalSpace(16),
              ] else
                const SizedBox(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    titleWidget,
                    if (subtitle != null) JinWidget.verticalSpace(4),
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
    );
  }
}
