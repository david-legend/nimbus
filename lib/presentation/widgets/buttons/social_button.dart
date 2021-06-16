import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class SocialButtonData {
  final String tag;
  final String url;
  final IconData iconData;
  final Color? iconColor;
  final Color? borderColor;

  SocialButtonData({
    required this.tag,
    required this.iconData,
    required this.url,
    this.iconColor,
    this.borderColor,
  });
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.tag,
    required this.iconData,
    required this.onPressed,
    this.width = Sizes.WIDTH_28,
    this.height = Sizes.HEIGHT_28,
    this.elevation = Sizes.ELEVATION_1,
    this.buttonColor = AppColors.white,
    this.iconColor = AppColors.black,
    this.iconSize = Sizes.ICON_SIZE_14,
    this.decoration,
  });

  final String tag;
  final double width;
  final double elevation;
  final double height;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final Color buttonColor;
  final BoxDecoration? decoration;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      child: FloatingActionButton(
        elevation: elevation,
        onPressed: onPressed,
        backgroundColor: buttonColor,
        heroTag: tag,
        child: Icon(
          iconData,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
