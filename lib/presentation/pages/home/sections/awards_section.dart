import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/bullet_text.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

//TODO:: Add correct spacing and padding
//TODO:: Add animation for My CV and image

class AwardsSection extends StatefulWidget {
  @override
  _AwardsSectionState createState() => _AwardsSectionState();
}

class _AwardsSectionState extends State<AwardsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool text1InView = false;
  bool text2InView = false;

  @override
  void initState() {
    super.initState();
  
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _controller.forward();
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context));
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = responsiveSize(
      context,
      screenWidth,
      screenWidth * 0.5,
      md: screenWidth * 0.5,
    );
    double contentAreaHeight = screenHeight * 0.9;
    return VisibilityDetector(
      key: Key('awards-section'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 50) {
          setState(() {
            text1InView = true;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: getSidePadding(context)),
        child: ResponsiveBuilder(
          refinedBreakpoints: RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth <= 1024) {
              return Column(
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
                  ResponsiveBuilder(
                    builder: (context, sizingInformation) {
                      double screenWidth = sizingInformation.screenSize.width;
                      if (screenWidth < (RefinedBreakpoints().tabletSmall)) {
                        return _buildImage(
                          width: screenWidth,
                          height: screenHeight * 0.5,
                        );
                      } else {
                        return Center(
                          child: _buildImage(
                            width: screenWidth * 0.75,
                            height: screenHeight * 0.75,
                          ),
                        );
                      }
                    },
                  ),
                ],
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
        fontSize: responsiveSize(context, 64, 80, md: 76),
        height: 1.25,
        color: AppColors.primaryColor,
      ),
    );
    double textPosition = assignWidth(context, 0.1);
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
                      return RotationTransition(
                        turns: _controller,
                        child: Image.asset(
                          ImagePath.DOTS_GLOBE_YELLOW,
                          width: Sizes.WIDTH_150,
                          height: Sizes.HEIGHT_150,
                        ),
                      );
                    } else {
                      return RotationTransition(
                        turns: _controller,
                        child: Image.asset(
                          ImagePath.DOTS_GLOBE_YELLOW,
                        ),
                      );
                    }
                  },
                ),
              ),
              Image.asset(
                ImagePath.DEV_AWARD,
              ),
              AnimatedPositioned(
                left: text1InView ? textPosition : -100,
                child: Text(StringConst.MY, style: titleStyle),
                 curve: Curves.fastOutSlowIn,
                 onEnd: (){
                   setState(() {
                     text2InView = true;
                   });
                 },
                 duration: Duration(milliseconds: 750),
              ),
              AnimatedPositioned(
                right: text2InView ? textPosition : -100,
                child: Text(StringConst.CV, style: titleStyle),
                 curve: Curves.fastOutSlowIn,
                 duration: Duration(milliseconds: 750),
              ),
            ],
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
