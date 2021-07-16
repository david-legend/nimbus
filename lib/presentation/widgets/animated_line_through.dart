import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class AnimatedLineThrough extends StatefulWidget {
  AnimatedLineThrough({
    required this.text,
    this.textStyle,
  });

  final String text;
  final TextStyle? textStyle;

  @override
  _AnimatedLineThroughState createState() => new _AnimatedLineThroughState();
}

class _AnimatedLineThroughState extends State<AnimatedLineThrough>
    with TickerProviderStateMixin {
  bool _isHovering = false;
  bool completed = false;
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    final CurvedAnimation curve =
        new CurvedAnimation(parent: controller, curve: Curves.easeOut);

    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() => setState(() {}));
//    controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child: Stack(
          children: <Widget>[
            Text(
              widget.text,
              style: widget.textStyle,
            ),
            if (_isHovering)
              DefaultTextStyle(
                style: widget.textStyle!.copyWith(
                  color: Colors.transparent,
                  decorationColor: AppColors.yellow500,
                  decorationStyle: TextDecorationStyle.solid,
                  decoration: TextDecoration.underline,
                ),
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText(widget.text),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    if (hovering) {
      print("HOVERING");

      setState(() {
        controller.forward();
        _isHovering = hovering;
      });
    } else {
      setState(() {
        controller.reverse();
        _isHovering = hovering;
      });
      print("GETTING OUT HOVERING");
    }
  }
}
