import 'dart:io';

import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Color iconColor;
  final IconData icon;

  ///A String similar to AppBar's title
  final String header;
  final TextStyle headerStyle;

  ///A callback when BackButton is Pressed, Default action is to Pop the context
  final Function onTap;
  final Color backgroundColor;
  final double marginLeft;

  ///Alignment of the header
  final Alignment headerAlignment;

  ///Create a Custom App Bar like Back Button with Header support
  CustomBackButton({
    this.iconColor,
    this.onTap,
    this.header,
    this.headerStyle = const TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    this.icon,
    this.headerAlignment = Alignment.center,
    this.backgroundColor = Colors.transparent,
    this.marginLeft = 4,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        alignment: Alignment.center,
        height: AppBar().preferredSize.height,
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
                    customBorder: StadiumBorder(),
                    onTap: onTap ?? () => Navigator.of(context).pop(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Platform.isIOS
                            ? Icons.arrow_back_ios
                            : Icons.arrow_back,
                        color: iconColor ?? Theme.of(context).iconTheme.color,
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
                      left: headerAlignment == Alignment.centerLeft ? 64 : 0),
                  child: Text(
                    header,
                    style: headerStyle,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
