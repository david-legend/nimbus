import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

//TODO:: Add background curves and designs

class StatItemData {
  final int value;
  final String subtitle;

  StatItemData({required this.value, required this.subtitle});
}

class StatisticsSection extends StatefulWidget {
  @override
  _StatisticsSectionState createState() => _StatisticsSectionState();
}

class _StatisticsSectionState extends State<StatisticsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double contentAreaWidth =
        widthOfScreen(context) - (getSidePadding(context) * 2);
    double contentAreaHeight = assignHeight(context, 0.7);
    return VisibilityDetector(
      key: Key('statistics-section'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 30) {
          _controller.forward();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
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
                      ..._buildItems(Data.statItemsData, isHorizontal: true),
                      Spacer(),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildItems(
    List<StatItemData> data, {
    bool isHorizontal = false,
  }) {
    List<Widget> items = [];
    for (int index = 0; index < data.length; index++) {
      items.add(
        StatItem(
          title: data[index].value,
          subtitle: data[index].subtitle,
          controller: _controller,
        ),
      );

      if (index < data.length - 1) {
        if (isHorizontal) {
          items.add(Spacer(flex: 2));
        } else {
          items.add(SpaceH40());
        }
      }
    }
    return items;
  }
}

class StatItem extends StatelessWidget {
  StatItem({
    required this.title,
    required this.subtitle,
    required this.controller,
    this.titleColor = AppColors.white,
    this.subtitleColor = AppColors.grey150,
    this.titleStyle,
    this.subtitleStyle,
    this.curve = Curves.easeIn,
  });

  final int title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final AnimationController controller;
  final Curve curve;

  late Animation<int> animation = IntTween(begin: 0, end: title).animate(
    CurvedAnimation(
      parent: controller,
      curve: curve,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return _buildChild(
          context: context,
          value: animation.value,
        );
      },
    );
  }

  Widget _buildChild({
    required BuildContext context,
    required int value,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          "$value",
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
