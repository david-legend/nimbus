import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class NimbusButton extends StatelessWidget {
  NimbusButton({
    required this.buttonTitle,
    this.width,
    this.height,
    this.titleStyle,
    this.titleColor = AppColors.white,
    this.buttonColor = AppColors.black,
    this.onPressed,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(Sizes.RADIUS_8),
    ),
  });

  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final String buttonTitle;
  final TextStyle? titleStyle;
  final Color titleColor;
  final Color buttonColor;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: borderRadius,
      child: MaterialButton(
        minWidth: width,
        height: height,
        onPressed: onPressed,
        color: buttonColor,
        child: Text(
          buttonTitle,
          style: titleStyle ?? textTheme.button?.copyWith(color: titleColor),
        ),
      ),
    );
  }
}
