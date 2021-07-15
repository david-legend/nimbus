import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

class SkillLevelData {
  final String skill;
  final double level;

  SkillLevelData({
    required this.skill,
    required this.level,
  });
}

class SkillLevel extends StatefulWidget {
  SkillLevel({
    required this.skill,
    required this.level,
    this.skillStyle,
    this.levelStyle,
    this.skillLevelColor = AppColors.yellow300,
    this.baseColor = AppColors.grey100,
    this.skillLevelWidth = 100,
    this.baseThickness = 2.0,
    this.skillLevelThickness = 7.0,
    this.curve = Curves.linearToEaseOut,
    this.duration = const Duration(milliseconds: 10000),
  });

  final String skill;
  final double level;
  final TextStyle? skillStyle;
  final TextStyle? levelStyle;
  final Color skillLevelColor;
  final Color baseColor;
  final double skillLevelWidth;
  final double baseThickness;
  final double skillLevelThickness;
  final Curve curve;
  final Duration duration;

  @override
  _SkillLevelState createState() => _SkillLevelState();
}

class _SkillLevelState extends State<SkillLevel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(_controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultStyle = textTheme.subtitle2;
    return Container(
      width: widget.skillLevelWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.skill,
                style: widget.skillStyle ?? defaultStyle,
              ),
              Text(
                "${widget.level} %",
                style: widget.levelStyle ?? defaultStyle,
              ),
            ],
          ),
          SpaceH8(),
          Stack(
            children: [
              Container(
                height: widget.baseThickness,
                margin: EdgeInsets.only(
                  top: (widget.skillLevelThickness - widget.baseThickness) / 2,
                ),
                width: widthOfScreen(context),
                color: widget.baseColor,
              ),
              AnimatedContainer(
                height: widget.skillLevelThickness,
                width: _controller.value,
                color: widget.skillLevelColor,
                duration: widget.duration,
                curve: widget.curve,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
