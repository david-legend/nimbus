import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    required this.tag,
    required this.iconData,
    required this.onPressed,
    this.iconColor = AppColors.white,
    this.iconSize = Sizes.ICON_SIZE_24,
  });

  final String tag;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
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
