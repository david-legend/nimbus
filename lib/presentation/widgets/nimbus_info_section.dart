import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/empty.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

class NimbusInfoSection extends StatelessWidget {
  final String sectionTitle;
  final String title1;
  final String title2;
  final bool hasTitle2;
  final String body;
  final TextStyle? sectionTitleStyle;
  final TextStyle? title1Style;
  final TextStyle? title2Style;
  final TextStyle? bodyStyle;
  final Color dividerColor;
  final double? thickness;
  final int quarterTurns;
  final double dividerHeight;
  final Widget? child;

  NimbusInfoSection({
    required this.sectionTitle,
    required this.title1,
    required this.body,
    this.title2 = "",
    this.sectionTitleStyle,
    this.title1Style,
    this.hasTitle2 = true,
    this.title2Style,
    this.bodyStyle,
    this.thickness,
    this.quarterTurns = 3,
    this.dividerColor = AppColors.red,
    this.dividerHeight = Sizes.HEIGHT_40,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.headline3?.copyWith();
    return Container(
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RotatedBox(
                  quarterTurns: quarterTurns,
                  child: Text(
                    sectionTitle,
                    style: textTheme.bodyText1?.copyWith(fontSize: 18),
                  ),
                ),
                SpaceH16(),
                Container(
                  height: dividerHeight,
                  child: VerticalDivider(
                    color: dividerColor,
                    thickness: thickness,
                  ),
                ),
              ],
            ),
            SpaceW16(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title1,
                    style: title1Style ?? titleStyle,
                  ),
                  hasTitle2 ? SpaceH16() : Empty(),
                  hasTitle2
                      ? Text(
                          title2,
                          style: title2Style ?? titleStyle,
                        )
                      : Empty(),
                  SpaceH20(),
                  Text(
                    body,
                    style: textTheme.bodyText1
                        ?.copyWith(fontSize: 18, height: 1.8),
                  ),
                  child != null ? SpaceH30() : Empty(),
                  child ?? Empty(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
