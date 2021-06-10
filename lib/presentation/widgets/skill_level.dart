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

class SkillLevel extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultStyle = textTheme.subtitle2;
    return Container(
      width: skillLevelWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill,
                style: skillStyle ?? defaultStyle,
              ),
              Text(
                "$level %",
                style: levelStyle ?? defaultStyle,
              ),
            ],
          ),
          SpaceH8(),
          Stack(
            children: [
              Container(
                height: baseThickness,
                margin: EdgeInsets.only(
                  top: (skillLevelThickness - baseThickness) / 2,
                ),
                width: widthOfScreen(context),
                color: baseColor,
              ),
              Container(
                height: skillLevelThickness,
                width: skillLevelWidth * (level / 100),
                color: skillLevelColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
