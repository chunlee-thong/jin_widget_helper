import 'package:flutter/material.dart';

class BadgeButton extends StatelessWidget {
  final Icon icon;
  final Color badgeColor;
  final String badgeText;
  final TextStyle badgeTextStyle;
  final bool showBadge;
  final EdgeInsets margin;
  final Function onTap;

  ///Create a Icon button with badge
  const BadgeButton({
    Key key,
    @required this.icon,
    this.badgeText = "",
    this.badgeTextStyle = const TextStyle(color: Colors.white, fontSize: 8),
    this.margin = const EdgeInsets.all(8),
    this.badgeColor,
    this.onTap,
    this.showBadge = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: onTap ?? () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon,
            ),
          ),
          if (showBadge)
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
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    badgeText,
                    style: badgeTextStyle,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
