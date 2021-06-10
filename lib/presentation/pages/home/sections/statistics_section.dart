import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:nimbus/values/values.dart';

class StatItemData {
  final String title;
  final String subtitle;

  StatItemData({required this.title, required this.subtitle});
}

class StatisticsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: assignWidth(context, 0.08),
      ),
      child: Card(
        elevation: 4,
        color: AppColors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              ..._buildItems(Data.statItemsData),
              Spacer(),
            ],
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
    this.subtitleColor = AppColors.white,
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
//      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ??
              textTheme.headline6?.copyWith(
                color: titleColor,
              ),
        ),
        SpaceH12(),
        Text(
          subtitle,
          style: subtitleStyle ??
              textTheme.subtitle1?.copyWith(
                color: subtitleColor,
              ),
        ),
      ],
    );
  }
}
