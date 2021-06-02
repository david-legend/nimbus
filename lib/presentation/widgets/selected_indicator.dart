import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class SelectedIndicator extends StatelessWidget {
  const SelectedIndicator(
      {this.indicatorColor = AppColors.primary200,
      this.height = Sizes.SIZE_4,
      this.width});

  final Color indicatorColor;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: indicatorColor,
    );
  }
}
