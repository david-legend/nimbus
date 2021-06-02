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
    this.buttonColor = AppColors.white,
    this.iconColor = AppColors.black,
    this.iconSize = Sizes.ICON_SIZE_24,
  });

  final String tag;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final Color buttonColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      heroTag: tag,
      child: Icon(iconData, size: iconSize, color: iconColor),
    );
  }
}
