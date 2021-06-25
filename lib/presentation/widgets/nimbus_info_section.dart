import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/empty.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

class NimbusInfoSection1 extends StatelessWidget {
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

  NimbusInfoSection1({
    required this.sectionTitle,
    required this.title1,
    required this.body,
    this.title2 = "",
    this.sectionTitleStyle,
    this.title1Style,
    this.hasTitle2 = true,
    this.title2Style,
    this.bodyStyle,
    this.thickness = 1.15,
    this.quarterTurns = 3,
    this.dividerColor = AppColors.grey350,
    this.dividerHeight = Sizes.HEIGHT_40,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.headline3?.copyWith(
      fontSize: responsiveSize(context, 26, 48, md: 32),
    );
    double fontSize = responsiveSize(context, 16, 18);
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
                    style: textTheme.bodyText2?.copyWith(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey250,
                    ),
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
                  hasTitle2
                      ? SizedBox(
                          height: responsiveSize(
                            context,
                            Sizes.HEIGHT_4,
                            Sizes.HEIGHT_16,
                            md: Sizes.HEIGHT_8,
                          ),
                        )
                      : Empty(),
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
                        ?.copyWith(fontSize: fontSize, height: 1.8),
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

class NimbusInfoSection2 extends StatelessWidget {
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
  final double dividerWidth;
  final Widget? child;

  NimbusInfoSection2({
    required this.sectionTitle,
    required this.title1,
    required this.body,
    this.title2 = "",
    this.sectionTitleStyle,
    this.title1Style,
    this.hasTitle2 = true,
    this.title2Style,
    this.bodyStyle,
    this.thickness = 1.15,
    this.dividerColor = AppColors.grey350,
    this.dividerWidth = Sizes.HEIGHT_64,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.headline3?.copyWith(
      fontSize: responsiveSize(context, 26, 48, md: 32),
    );
    double fontSize = responsiveSize(context, 16, 18);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: dividerWidth,
              child: Divider(
                color: dividerColor,
                thickness: thickness,
              ),
            ),
            SpaceW16(),
            Text(
              sectionTitle,
              style: textTheme.bodyText2?.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                color: AppColors.grey250,
              ),
            ),
          ],
        ),
        SpaceH16(),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title1,
              style: title1Style ?? titleStyle,
            ),
            hasTitle2
                ? SizedBox(
                    height: responsiveSize(
                      context,
                      Sizes.HEIGHT_4,
                      Sizes.HEIGHT_16,
                      md: Sizes.HEIGHT_8,
                    ),
                  )
                : Empty(),
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
                  ?.copyWith(fontSize: fontSize, height: 1.8),
            ),
            child != null ? SpaceH30() : Empty(),
            child ?? Empty(),
          ],
        ),
      ],
    );
  }
}
