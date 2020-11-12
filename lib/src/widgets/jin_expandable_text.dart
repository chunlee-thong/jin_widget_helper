import 'package:flutter/material.dart';

///Wrap the text with ellipsis style provided bu [subStringLength]
class JinExpandableText extends StatefulWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final String text;
  final int subStringLength;
  final String seeMoreText;
  final String seeLessText;
  final Function(bool) onChanged;
  const JinExpandableText({
    Key key,
    @required this.text,
    this.subStringLength = 50,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.seeMoreText = "See more",
    this.seeLessText = "See less",
    this.onChanged,
  }) : super(key: key);

  @override
  _JinExpandableTextState createState() => _JinExpandableTextState();
}

class _JinExpandableTextState extends State<JinExpandableText> {
  bool isExpanded = false;
  bool get isExpandable =>
      widget.text.length > 50 && widget.text.length > widget.subStringLength;
  String getSubStringText() {
    if (isExpandable) {
      return widget.text.substring(0, widget.subStringLength) + "...";
    }
    return widget.text;
  }

  void onToggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
    widget.onChanged?.call(isExpanded);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
          text: isExpanded ? widget.text : getSubStringText(),
          style: Theme.of(context).textTheme.bodyText2,
          children: [
            if (isExpandable)
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: GestureDetector(
                    onTap: onToggle,
                    child: Text(
                      isExpanded ? widget.seeLessText : widget.seeMoreText,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
