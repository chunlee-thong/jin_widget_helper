import 'package:flutter/material.dart';

import '../../jin_widget_helper.dart';

///Wrap the text with ellipsis style provided bu [subStringLength]
class JinExpandableText extends StatefulWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final String text;
  final int subStringLength;
  final String seeMoreText;
  final String seeLessText;
  const JinExpandableText({
    Key key,
    @required this.text,
    this.subStringLength = 50,
    this.margin,
    this.padding,
    this.seeMoreText = "See more",
    this.seeLessText = "See less",
  }) : super(key: key);

  @override
  _JinExpandableTextState createState() => _JinExpandableTextState();
}

class _JinExpandableTextState extends State<JinExpandableText>
    with TickerProviderStateMixin<JinExpandableText> {
  bool isExpanded = false;
  bool get isExpandable =>
      widget.text.length > 50 && widget.text.length > widget.subStringLength;
  String getText() {
    if (isExpandable) {
      return widget.text.substring(0, widget.subStringLength) + "...";
    }
    return widget.text;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      padding: widget.padding ?? EdgeInsets.zero,
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          text: isExpanded ? widget.text : getText(),
          style: Theme.of(context).textTheme.bodyText2,
          children: [
            if (isExpandable)
              WidgetSpan(
                child: SmallIconButton(
                  margin: EdgeInsets.only(left: 6),
                  padding: EdgeInsets.zero,
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  icon: Text(
                    isExpanded ? widget.seeLessText : widget.seeMoreText,
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
