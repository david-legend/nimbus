import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

class TextWithBullet extends StatelessWidget {
  TextWithBullet({
    required this.text,
    this.textStyle,
    this.spacing,
  });

  final String text;
  final TextStyle? textStyle;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Bullet(),
        spacing == null ? SpaceW16() : SizedBox(width: spacing),
        Text(
          text,
          style: textStyle ??
              textTheme.bodyText1?.copyWith(
                color: AppColors.black,
              ),
        ),
      ],
    );
  }
}

class Bullet extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color color;

  Bullet({
    this.width = 4.0,
    this.height = 4.0,
    this.borderRadius = 20,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
    );
  }
}
