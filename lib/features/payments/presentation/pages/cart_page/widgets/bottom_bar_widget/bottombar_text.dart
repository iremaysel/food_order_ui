import 'package:flutter/material.dart';

class BottomBarText extends StatefulWidget {
  String title_text;
  String price_text;
  double font_size;
  FontWeight fontWeight;
  Color text_color;

  BottomBarText({
    required this.title_text,
    required this.price_text,
    required this.font_size,
    required this.fontWeight,
    required this.text_color});

  @override
  _BottomBarTextState createState() => _BottomBarTextState();
}

class _BottomBarTextState extends State<BottomBarText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.title_text, style: TextStyle(fontWeight: widget.fontWeight, fontSize: widget.font_size, color: widget.text_color),),
        Spacer(),
        Text(widget.price_text, style: TextStyle(fontWeight: widget.fontWeight, fontSize: widget.font_size, color: widget.text_color),),
      ],
    );
  }
}
