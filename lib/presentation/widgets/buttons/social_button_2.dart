import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

class SocialButton2Data {
  final String title;
  final String url;
  final IconData iconData;
  final Color? iconColor;
  final Color? buttonColor;
  final Color? titleColor;

  SocialButton2Data({
    required this.title,
    required this.iconData,
    required this.url,
    this.iconColor,
    this.buttonColor,
    this.titleColor,
  });
}

class SocialButton2 extends StatelessWidget {
  SocialButton2({
    required this.title,
    required this.iconData,
    required this.onPressed,
    this.titleStyle,
    this.titleColor = AppColors.black,
    this.width = Sizes.WIDTH_60,
    this.height = Sizes.HEIGHT_40,
    this.elevation = Sizes.ELEVATION_1,
    this.buttonColor = AppColors.white,
    this.iconColor = AppColors.black,
    this.iconSize = Sizes.ICON_SIZE_20,
    this.hasTitle = true,
  });

  final String title;
  final Color? titleColor;
  final TextStyle? titleStyle;
  final bool hasTitle;
  final double width;
  final double height;
  final double elevation;
  final IconData iconData;
  final double iconSize;
  final Color? iconColor;
  final Color? buttonColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: MaterialButton(
            onPressed: onPressed,
            child: Icon(
              iconData,
              size: iconSize,
              color: iconColor,
            ),
          ),
        ),
        SpaceW12(),
        Text(
          title,
          style: titleStyle ??
              textTheme.subtitle2?.copyWith(
                fontSize: Sizes.TEXT_SIZE_13,
                color: titleColor,
              ),
        ),
      ],
    );
  }
}
