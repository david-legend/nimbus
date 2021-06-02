import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class SelectedIndicator extends StatelessWidget {
  const SelectedIndicator({
    this.indicatorColor = AppColors.primary200,
    this.height = Sizes.SIZE_6,
    this.width = Sizes.WIDTH_60,
    this.opacity = 0.85,
  });

  final Color indicatorColor;
  final double? width;
  final double height;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: width,
        height: height,
        color: indicatorColor,
      ),
    );
  }
}
