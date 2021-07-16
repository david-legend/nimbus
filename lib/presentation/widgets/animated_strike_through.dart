import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class AnimatedStrikeThrough extends StatefulWidget {
  const AnimatedStrikeThrough({
    required this.text,
    this.width,
    this.textStyle,
    this.indicatorColor = AppColors.yellow450,
    this.height = Sizes.SIZE_6,
    this.curve = Curves.linearToEaseOut,
    this.isHover = false,
    this.duration = const Duration(milliseconds: 300),
  });

  final String text;
  final TextStyle? textStyle;
  final Color indicatorColor;
  final double? width;
  final double height;
  final Curve curve;
  final Duration duration;
  final bool isHover;

  @override
  _AnimatedStrikeThroughState createState() => _AnimatedStrikeThroughState();
}

class _AnimatedStrikeThroughState extends State<AnimatedStrikeThrough> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _onHover(true),
      onExit: (e) => _onHover(false),
      child: Stack(
        children: [
          AnimatedContainer(
            width: _isHovering ? textSize(widget.text, TextStyle()).width : 0,
            height: widget.height,
            color: widget.indicatorColor,
            duration: widget.duration,
            curve: widget.curve,
          ),
          Text(
            widget.text,
            style: widget.textStyle,
          )
        ],
      ),
    );
  }

  Size textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  void _onHover(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
//    if (hovering) {
//
//    } else {
//      setState(() {
//        _isHovering = hovering;
//        _showText = false;
//      });
//    }
  }
}
