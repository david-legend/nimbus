import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class ContentArea extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;
  final BorderRadius borderRadius;
  final Widget? child;

  ContentArea({
    this.width,
    this.height,
    this.backgroundColor,
    this.padding,
    this.decoration,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(Sizes.RADIUS_0),
    ),
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      decoration: decoration ??
          BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
      child: child,
    );
  }
}
