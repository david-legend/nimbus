import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/values/values.dart';

class NimbusButton extends StatelessWidget {
  NimbusButton({
    required this.buttonTitle,
    this.width = Sizes.WIDTH_150,
    this.height = Sizes.HEIGHT_60,
    this.titleStyle,
    this.titleColor = AppColors.white,
    this.buttonColor = AppColors.black100,
    this.onPressed,
    this.padding = const EdgeInsets.all(Sizes.PADDING_8),
    this.borderRadius = const BorderRadius.all(
      Radius.circular(Sizes.RADIUS_4),
    ),
  });

  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final String buttonTitle;
  final TextStyle? titleStyle;
  final Color titleColor;
  final Color buttonColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double textSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_14,
      Sizes.TEXT_SIZE_16,
      md: Sizes.TEXT_SIZE_15,
    );
    return ClipRRect(
      borderRadius: borderRadius,
      child: MaterialButton(
        minWidth: width,
        height: height,
        onPressed: onPressed,
        color: buttonColor,
        child: Padding(
          padding: padding,
          child: Text(
            buttonTitle,
            style: titleStyle ??
                textTheme.button?.copyWith(
                  color: titleColor,
                  fontSize: textSize,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
