import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/buttons/social_button_2.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/empty.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/utils/functions.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

//TODO:: Make nimbusInfosection 1 & 2 break at right break points
//TODO:: Add the right fontFamily and styles to text in this section
//TODO:: Add grey dotted globe image
//TODO:: Add the right colors to text and dividers
//TODO:: Add the right colors to text and dividers
//TODO:: Add animation to socialButton2
//TODO:: Add floating bubbles if I am feeling adventurous

const double kSpacing = 24.0;
const double kRunSpacing = 16.0;

class AboutMeSection extends StatefulWidget {
  @override
  _AboutMeSectionState createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidthSm = screenWidth * 1.0;
    double contentAreaHeightSm = screenHeight * 1.1;
    double contentAreaWidthLg = screenWidth * 0.5;
    double contentAreaHeightLg = screenHeight * 0.9;
    TextStyle? titleStyle =
        textTheme.headline1?.copyWith(color: AppColors.black);
    return Container(
      child: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth < (RefinedBreakpoints().tabletLarge)) {
            return Column(
              children: [
                ContentArea(
                  width: contentAreaWidthSm,
                  child: _buildImage(
                    width: contentAreaWidthSm,
                    height: contentAreaHeightSm,
                  ),
                ),
                SpaceH40(),
                ContentArea(
                  width: contentAreaWidthSm,
                  height: contentAreaHeightSm,
                  child: _buildAboutMe(
                    width: contentAreaWidthSm,
                    height: contentAreaHeightSm,
                  ),
                ),
              ],
            );
          } else {
            return Row(
              children: [
                ContentArea(
                  width: contentAreaWidthLg,
                  height: contentAreaHeightLg,
                  child: _buildImage(
                    width: contentAreaWidthLg,
                    height: contentAreaHeightLg,
                  ),
                ),
                ContentArea(
                  width: contentAreaWidthLg,
                  height: contentAreaHeightLg,
                  child: _buildAboutMe(
                    width: contentAreaWidthLg,
                    height: contentAreaHeightLg,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  List<Widget> _buildSocialButtons(List<SocialButton2Data> data) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        SocialButton2(
          title: data[index].title.toUpperCase(),
          iconData: data[index].iconData,
          onPressed: () => openUrlLink(data[index].url),
          titleColor: data[index].titleColor,
          buttonColor: data[index].buttonColor,
          iconColor: data[index].iconColor,
        ),
      );
    }
    return items;
  }

  Widget _buildImage({required double width, required double height}) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? titleStyle = textTheme.bodyText1?.merge(
      Styles.customTextStyle3(fontSize: 72, height: 1.25),
    );

    return Stack(
      children: [
        Positioned(
          top: height * 0.1,
          right: -(width * 0.20),
          child: ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < (RefinedBreakpoints().tabletLarge)) {
                return Image.asset(
                  ImagePath.BLOB_BLACK,
                  height: height * 0.25,
                  width: width * 0.25,
                );
              } else {
                return Empty();
              }
            },
          ),
        ),
        Image.asset(
          ImagePath.DEV_ABOUT_ME,
          width: width * 0.95,
        ),
        Positioned(
          top: width * 0.2,
          left: width * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringConst.HI,
                style: titleStyle,
              ),
              Text(
                StringConst.THERE,
                style: titleStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAboutMe({
    required double width,
    required double height,
  }) {
    return Stack(
      children: [
        //positions blob on the far right of the section
        //based on the calculation only 10% of blob is showing

        Positioned(
          top: height * 0.2,
          left: width * 0.90,
          child: ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < (RefinedBreakpoints().tabletLarge)) {
                return Empty();
              } else {
                return Image.asset(
                  ImagePath.BLOB_BLACK,
                  height: height * 0.30,
                  width: width * 0.30,
                );
              }
            },
          ),
        ),

        ResponsiveBuilder(
          refinedBreakpoints: RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < (RefinedBreakpoints().tabletLarge)) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: nimbusInfoSectionSmScreens(),
              );
            } else {
              //This container takes 85% of the space and leave 15% as spacing
              //between the blob and the content
              return Container(
                width: width * 0.85,
                child: nimbusInfoSectionLgScreens(),
              );
            }
          },
        ),
      ],
    );
  }

  Widget nimbusInfoSectionLgScreens() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              NimbusInfoSection1(
                sectionTitle: StringConst.ABOUT_ME,
                title1: StringConst.CREATIVE_DESIGN,
                title2: StringConst.HELP,
                body: StringConst.ABOUT_ME_DESC,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConst.FOLLOW_ME_1,
                      style:
                          textTheme.headline6?.copyWith(color: AppColors.black),
                    ),
                    SpaceH16(),
                    Row(
                      children: [
                        Wrap(
                          spacing: kSpacing,
                          runSpacing: kRunSpacing,
                          children: _buildSocialButtons(
                            Data.socialData2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  Widget nimbusInfoSectionSmScreens() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return NimbusInfoSection2(
      sectionTitle: StringConst.ABOUT_ME,
      title1: StringConst.CREATIVE_DESIGN,
      title2: StringConst.HELP,
      body: StringConst.ABOUT_ME_DESC,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConst.FOLLOW_ME_1,
            style: textTheme.headline6?.copyWith(color: AppColors.black),
          ),
          SpaceH16(),
          Row(
            children: [
              Wrap(
                spacing: kSpacing,
                runSpacing: kRunSpacing,
                children: _buildSocialButtons(
                  Data.socialData2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
