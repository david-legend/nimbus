import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class AnimatedHoverIndicator extends StatelessWidget {
  const AnimatedHoverIndicator({
    required this.width,
    this.indicatorColor = AppColors.yellow450,
    this.height = Sizes.SIZE_6,
    this.opacity = 0.85,
    this.curve = Curves.linearToEaseOut,
    this.isHover = false,
    this.duration = const Duration(milliseconds: 300),
  });

  final Color indicatorColor;
  final double width;
  final double height;
  final double opacity;
  final Curve curve;
  final Duration duration;
  final bool isHover;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: AnimatedContainer(
        width: isHover ? width : 0,
        height: height,
        color: indicatorColor,
        duration: duration,
        curve: curve,
      ),
    );
  }
}
