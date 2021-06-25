import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

//TODO:: Add appropriate fontsSizes and families
//TODO:: Add background curves and designs
//TODO:: Add appropriate text colors
//TODO:: Add the right boxHeight for section
class StatItemData {
  final String title;
  final String subtitle;

  StatItemData({required this.title, required this.subtitle});
}

class StatisticsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double contentAreaWidth = widthOfScreen(context);
    double contentAreaHeight = assignHeight(context, 0.7);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: assignWidth(context, 0.08),
      ),
      child: Card(
        elevation: Sizes.ELEVATION_4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.RADIUS_10),
        ),
        color: AppColors.black400,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_40),
          child: ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < (RefinedBreakpoints().tabletLarge)) {
                return Container(
                  height: contentAreaHeight,
                  width: contentAreaWidth,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SpaceH30(),
                      ..._buildItems(Data.statItemsData),
                      SpaceH30(),
                    ],
                  ),
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Spacer(),
                    ..._buildItems(Data.statItemsData),
                    Spacer(),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  List<Widget> _buildItems(List<StatItemData> data) {
    List<Widget> items = [];
    for (int index = 0; index < data.length; index++) {
      items.add(
        StatItem(
          title: data[index].title,
          subtitle: data[index].subtitle,
        ),
      );

      if (index < data.length - 1) {
        items.add(Spacer(flex: 2));
      }
    }
    return items;
  }
}

class StatItem extends StatelessWidget {
  StatItem({
    required this.title,
    required this.subtitle,
    this.titleColor = AppColors.white,
    this.subtitleColor = AppColors.grey150,
    this.titleStyle,
    this.subtitleStyle,
  });

  final String title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          title,
          style: titleStyle ??
              textTheme.headline3?.copyWith(
                color: titleColor,
              ),
        ),
        SpaceH12(),
        Text(
          subtitle,
          style: subtitleStyle ??
              textTheme.bodyText1?.copyWith(
                color: subtitleColor,
                fontSize: 16,
              ),
        ),
      ],
    );
  }
}
