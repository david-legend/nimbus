import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class NimbusVerticalDivider extends StatelessWidget {
  const NimbusVerticalDivider({
    this.thickness = 2,
    this.width,
    this.color = AppColors.black,
  });

  final double? width;
  final int thickness;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(thickness: 2);
  }
}
