import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class SelectedIndicator extends StatelessWidget {
  const SelectedIndicator({
    required this.width,
    this.indicatorColor = AppColors.primary200,
    this.height = Sizes.SIZE_6,
    this.opacity = 0.85,
    this.isHover = false,
  });

  final Color indicatorColor;
  final double width;
  final double height;
  final double opacity;
  final bool isHover;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: AnimatedContainer(
        width: isHover ? width : 0,
        height: height,
        color: indicatorColor,
        duration: Duration(milliseconds: 300),
      ),
    );
  }
}
