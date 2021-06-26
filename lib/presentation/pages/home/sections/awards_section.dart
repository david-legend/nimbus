import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/bullet_text.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

//TODO:: Add correct spacing and padding
//TODO:: Add animation for My CV and image

class AwardsSection extends StatefulWidget {
  @override
  _AwardsSectionState createState() => _AwardsSectionState();
}

class _AwardsSectionState extends State<AwardsSection> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = responsiveSize(
      context,
      screenWidth,
      screenWidth * 0.5,
      md: screenWidth * 0.5,
    );
    double contentAreaHeight = screenHeight * 0.9;
    return Container(
      child: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth <= 1024) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  ResponsiveBuilder(
                    builder: (context, sizingInformation) {
                      double screenWidth = sizingInformation.screenSize.width;
                      if (screenWidth < (RefinedBreakpoints().tabletSmall)) {
                        return _buildNimbusInfoSectionSm();
                      } else {
                        return _buildNimbusInfoSectionLg();
                      }
                    },
                  ),
                  SpaceH50(),
                  _buildImage(
                    width: contentAreaWidth,
                    height: contentAreaHeight,
                  ),
                ],
              ),
            );
          } else {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContentArea(
                  width: contentAreaWidth,
                  height: contentAreaHeight,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Spacer(),
                              _buildNimbusInfoSectionLg(),
                              Spacer(flex: 2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildImage(
                  width: contentAreaWidth,
                  height: contentAreaHeight,
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildNimbusInfoSectionSm() {
    return NimbusInfoSection2(
      sectionTitle: StringConst.MY_AWARDS,
      title1: StringConst.AWARDS_TITLE,
      hasTitle2: false,
      body: StringConst.AWARDS_DESC,
      child: Column(
        children: [
          _buildAwards1(),
          SpaceH40(),
          _buildAwards2(),
          SpaceH40(),
        ],
      ),
    );
  }

  Widget _buildNimbusInfoSectionLg() {
    return NimbusInfoSection1(
      sectionTitle: StringConst.MY_AWARDS,
      title1: StringConst.AWARDS_TITLE,
      hasTitle2: false,
      body: StringConst.AWARDS_DESC,
      child: Container(
        color: Colors.red,
        child: Row(
          children: [
            _buildAwards1(),
            Spacer(),
            _buildAwards2(),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }

  Widget _buildImage({
    required double width,
    required double height,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.bodyText1?.merge(
      Styles.customTextStyle3(
        fontSize: 72,
        height: 1.25,
        color: AppColors.primaryColor,
      ),
    );
    return ContentArea(
      width: width,
      height: height,
      child: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                child: ResponsiveBuilder(
                  refinedBreakpoints: RefinedBreakpoints(),
                  builder: (context, sizingInformation) {
                    double screenWidth = sizingInformation.screenSize.width;
                    if (screenWidth < (RefinedBreakpoints().tabletSmall)) {
                      return Image.asset(
                        ImagePath.DOTS_GLOBE_YELLOW,
                        width: Sizes.WIDTH_150,
                        height: Sizes.HEIGHT_150,
                      );
                    } else {
                      return Image.asset(
                        ImagePath.DOTS_GLOBE_YELLOW,
                      );
                    }
                  },
                ),
              ),
              Image.asset(
                ImagePath.DEV_AWARD,
              ),
            ],
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(
                left: assignWidth(context, 0.1),
                top: Sizes.PADDING_24,
                right: assignWidth(context, 0.1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(StringConst.MY, style: titleStyle),
                  Text(StringConst.CV, style: titleStyle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAwards1() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConst.AWARDS_TYPE_TITLE_1,
          style: textTheme.headline6,
        ),
        SpaceH16(),
        ..._buildAwards(Data.awards1),
      ],
    );
  }

  Widget _buildAwards2() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConst.AWARDS_TYPE_TITLE_2,
          style: textTheme.headline5,
        ),
        SpaceH16(),
        ..._buildAwards(Data.awards1),
      ],
    );
  }

  List<Widget> _buildAwards(List<String> awards) {
    List<Widget> items = [];
    for (int index = 0; index < awards.length; index++) {
      items.add(TextWithBullet(text: awards[index]));
      items.add(SpaceH16());
    }
    return items;
  }
}
