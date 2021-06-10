import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/circular_container.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

class SkillCardData {
  final String title;
  final IconData iconData;

  SkillCardData({required this.title, required this.iconData});
}

class SkillCard extends StatelessWidget {
  SkillCard({
    this.title = "",
    this.titleStyle,
    this.width,
    this.height,
    this.iconSize = 40,
    this.elevation = Sizes.ELEVATION_4,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.backgroundColor = AppColors.white,
    this.iconData = Icons.phone,
    this.iconColor = AppColors.white,
    this.iconBackgroundColor = AppColors.black,
    this.child,
  });

  final String title;
  final TextStyle? titleStyle;
  final double? width;
  final double? height;
  final double iconSize;
  final double elevation;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color iconColor;
  final Color iconBackgroundColor;
  final IconData iconData;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: Card(
        color: backgroundColor,
        elevation: elevation,
        child: child ??
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularContainer(
                  backgroundColor: iconBackgroundColor,
                  padding: const EdgeInsets.all(16),
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  iconData: iconData,
                  iconColor: iconColor,
                  iconSize: iconSize,
                ),
                SpaceH12(),
                SelectableText(
                  title,
                  textAlign: TextAlign.center,
                  style: titleStyle ?? textTheme.subtitle1,
                ),
              ],
            ),
      ),
    );
  }
}
