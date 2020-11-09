import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Icon icon;
  final Color iconColor;

  ///A String similar to AppBar's title
  final String header;
  final TextStyle headerStyle;

  ///A callback when BackButton is Pressed, Default action is to Pop the context
  final Function onTap;
  final Color backgroundColor;
  final double marginLeft;

  ///Alignment of the header
  final Alignment headerAlignment;

  //elevation of the header
  final double elevation;

  final double titleMargin = 56.0;

  ///Create a Custom App Bar like Back Button with Header support
  CustomBackButton({
    this.onTap,
    this.header,
    this.headerStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    this.icon,
    this.headerAlignment = Alignment.center,
    this.backgroundColor = Colors.transparent,
    this.marginLeft = 4,
    this.iconColor,
    this.elevation = 0.0,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      elevation: elevation,
      child: SafeArea(
        bottom: false,
        child: Container(
          alignment: Alignment.center,
          height: kToolbarHeight,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: marginLeft),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      focusColor: Colors.white70,
                      customBorder: const StadiumBorder(),
                      onTap: onTap ?? () => Navigator.of(context).pop(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: icon ??
                            BackButton(
                              color: iconColor ??
                                  Theme.of(context).iconTheme.color,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
              if (header != null)
                Align(
                  alignment: headerAlignment,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: headerAlignment == Alignment.centerLeft
                            ? titleMargin + marginLeft
                            : 0),
                    child: Text(
                      header,
                      style: headerStyle,
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
