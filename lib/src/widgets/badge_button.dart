import 'package:flutter/material.dart';

class BadgeButton extends StatelessWidget {
  final Icon icon;
  final Color badgeColor;
  final String badgeText;
  final TextStyle badgeTextStyle;
  final bool showBadge;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Function onTap;

  ///Create a Icon button with badge
  const BadgeButton({
    Key key,
    @required this.icon,
    this.badgeText = "",
    this.badgeTextStyle,
    this.margin = const EdgeInsets.all(8),
    this.padding = const EdgeInsets.all(8),
    this.badgeColor,
    this.onTap,
    @required this.showBadge,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextStyle defaultBadgeStyle =
        const TextStyle(color: Colors.white, fontSize: 8);
    return Container(
      margin: margin,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap ?? () {},
          child: Stack(
            children: <Widget>[
              Padding(
                padding: padding,
                child: icon,
              ),
              if (showBadge && badgeText.isNotEmpty)
                Positioned(
                  top: 4,
                  right: 4,
                  child: ClipOval(
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: badgeColor ?? Colors.red,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        badgeText,
                        style: badgeTextStyle ?? defaultBadgeStyle,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
