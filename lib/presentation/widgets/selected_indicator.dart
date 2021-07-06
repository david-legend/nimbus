import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class SelectedIndicator extends StatelessWidget {
  const SelectedIndicator({
    required this.width,
    this.indicatorColor = AppColors.yellow450,
    this.height = Sizes.SIZE_6,
    this.opacity = 0.85,
  });

  final Color indicatorColor;
  final double width;
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
