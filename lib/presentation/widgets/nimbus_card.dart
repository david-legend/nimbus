import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/empty.dart';
import 'package:nimbus/values/values.dart';

class NimBusCard extends StatelessWidget {
  NimBusCard({
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.columnMainAxisAlignment = MainAxisAlignment.start,
    this.columnCrossAxisAlignment = CrossAxisAlignment.start,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
    this.width,
    this.height,
    this.elevation = Sizes.ELEVATION_4,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.padding = const EdgeInsets.symmetric(
      horizontal: Sizes.PADDING_12,
      vertical: Sizes.PADDING_12,
    ),
  });

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final double? width;
  final double? height;
  final double? elevation;
  final MainAxisAlignment columnMainAxisAlignment;
  final CrossAxisAlignment columnCrossAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;
  final MainAxisAlignment rowMainAxisAlignment;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Card(
          elevation: elevation,
          child: Padding(
            padding: padding,
            child: Row(
              mainAxisAlignment: rowMainAxisAlignment,
              crossAxisAlignment: rowCrossAxisAlignment,
              children: [
                leading ?? Empty(),
                leading != null ? Spacer() : Empty(),
                Column(
                  mainAxisAlignment: columnMainAxisAlignment,
                  crossAxisAlignment: columnCrossAxisAlignment,
                  children: [
                    Spacer(),
                    title ?? Empty(),
                    subtitle ?? Empty(),
                    Spacer(),
                  ],
                ),
                trailing != null ? Spacer() : Empty(),
                trailing ?? Empty(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
