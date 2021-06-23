import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/buttons/social_button.dart';
import 'package:nimbus/presentation/widgets/circular_container.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/empty.dart';
import 'package:nimbus/presentation/widgets/nimbus_card.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/utils/functions.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

//TODO:: Add Responsiveness to header section (working on dev_image and globe image)
//TODO:: Position cards at right position with right spacing (in between them)
//TODO:: Add background ash blobs
//TODO:: Add animation to rotating dots_globe_grey and dots_globe_yellow
//TODO:: Animation to button. (Channel your adventurous self)
const double bodyTextSizeLg = 16.0;
const double bodyTextSizeSm = 14.0;
const double socialTextSizeLg = 18.0;
const double socialTextSizeSm = 14.0;

class HeaderSection extends StatefulWidget {
  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double sidePadding = responsiveSize(
      context,
      16,
      getSidePadding(context),
      md: getSidePadding(context),
    );
    double headerIntroTextSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_28,
      Sizes.TEXT_SIZE_56,
      md: Sizes.TEXT_SIZE_36,
    );

    double bodyTextSize =
        responsiveSize(context, bodyTextSizeSm, bodyTextSizeLg);
    double socialTextSize =
        responsiveSize(context, socialTextSizeSm, socialTextSizeLg);
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth;
    double contentAreaHeight = responsiveSize(
      context,
      screenHeight * 0.8,
      screenHeight * 1.20,
    );
    double hiddenPortionOfHeaderImage = responsiveSize(
      context,
      (contentAreaWidth * 0.5),
      (contentAreaWidth * 0.3),
      sm: (contentAreaWidth * 0.4),
      md: (contentAreaWidth * 0.45),
    );
    double widthOfBlackBlob = contentAreaWidth * 0.5;
    double hiddenPortionOfBlackBlob = widthOfBlackBlob * 0.95;
    TextStyle? bodyTextStyle =
        textTheme.bodyText1?.copyWith(fontSize: bodyTextSize);
    TextStyle? socialTitleStyle =
        textTheme.subtitle1?.copyWith(fontSize: socialTextSize);
    return ContentArea(
      width: contentAreaWidth,
      height: contentAreaHeight,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: headerIntroTextSize),
            child: SelectableText(
              StringConst.FIRST_NAME,
              style: textTheme.headline1?.copyWith(
                color: AppColors.grey50,
                fontSize: headerIntroTextSize * 2,
              ),
            ),
          ),
          Positioned(
            right: -hiddenPortionOfHeaderImage,
            top: -(contentAreaHeight * 0.035),
            child: _buildResponsiveHeaderImage(
              contentWidth: contentAreaWidth,
              contentHeight: contentAreaHeight,
            ),
          ),
          Positioned(
            left: -hiddenPortionOfBlackBlob,
            child: _buildBlob(
              blobWidth: widthOfBlackBlob,
              blobHeight: contentAreaHeight,
            ),
          ),
          Positioned(
            top: contentAreaHeight * 0.2,
            left: sidePadding,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      StringConst.INTRO,
                      style: textTheme.headline2?.copyWith(
                        fontSize: headerIntroTextSize,
                      ),
                    ),
                    SelectableText(
                      StringConst.POSITION,
                      style: textTheme.headline2?.copyWith(
                        fontSize: headerIntroTextSize,
                        color: AppColors.primaryColor,
                        height: 1.2,
                      ),
                    ),
                    SpaceH16(),
                    SelectableText(
                      StringConst.ABOUT_ME_1,
                      style: bodyTextStyle,
                    ),
                    SpaceH8(),
                    SelectableText(
                      StringConst.ABOUT_ME_2,
                      style: bodyTextStyle,
                    ),
                    SpaceH30(),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText(
                              "${StringConst.EMAIL}:",
                              style: socialTitleStyle,
                            ),
                            SpaceH8(),
                            SelectableText(
                              "${StringConst.DEV_EMAIL_2}",
                              style: bodyTextStyle,
                            ),
                          ],
                        ),
                        SpaceW40(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText(
                              "${StringConst.BEHANCE}:",
                              style: socialTitleStyle,
                            ),
                            SpaceH8(),
                            SelectableText(
                              "${StringConst.BEHANCE_ID}",
                              style: bodyTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SpaceH40(),
                    Row(
                      children: [
                        NimbusButton(
                          buttonTitle: StringConst.DOWNLOAD_CV,
                          buttonColor: AppColors.primaryColor,
                          onPressed: () => openUrlLink(StringConst.EMAIL_URL),
                        ),
                        SpaceW20(),
                        NimbusButton(
                          buttonTitle: StringConst.HIRE_ME_NOW,
                          onPressed: () => openUrlLink(StringConst.EMAIL_URL),
                        ),
                      ],
                    ),
                    SpaceH30(),
                    Wrap(
                      children: _buildSocialIcons(Data.socialData),
                    )
                  ],
                ),
              ],
            ),
          ),
//          Column(
//            children: [
//              Spacer(),
//              Row(
//                children: [
//                  Spacer(),
//                  ..._buildCardRow(
//                    data: Data.nimbusCardData,
//                    width: contentAreaWidth,
//                  ),
//                  Spacer(),
//                ],
//              ),
//            ],
//          ),
        ],
      ),
    );
  }

  List<Widget> _buildSocialIcons(List<SocialButtonData> socialItems) {
    List<Widget> items = [];
    for (int index = 0; index < socialItems.length; index++) {
      items.add(
        InkWell(
          onTap: () => openUrlLink(socialItems[index].url),
          child: Icon(
            socialItems[index].iconData,
            color: AppColors.black,
            size: Sizes.ICON_SIZE_18,
          ),
        ),
      );
      items.add(SpaceW20());
    }
    return items;
  }

  Widget _buildBlob({required double blobWidth, required double blobHeight}) {
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth < RefinedBreakpoints().desktopSmall) {
          return Empty();
        } else {
          return Image.asset(
            ImagePath.BLOB_BLACK,
            height: blobHeight,
            width: blobWidth,
          );
        }
      },
    );
  }

  Widget _buildHeaderImage({
    required double devImageHeight,
    double? devImageWidth,
    double? globeImageWidth,
    double? globeImageHeight,
  }) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          child: Image.asset(
            ImagePath.DOTS_GLOBE_GREY,
            width: globeImageWidth,
            height: globeImageHeight,
          ),
        ),
        Image.asset(
          ImagePath.DEV_HEADER,
          width: devImageWidth,
          height: devImageHeight,
        ),
      ],
    );
  }

  Widget _buildResponsiveHeaderImage({
    required double contentWidth,
    required double contentHeight,
  }) {
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth <= RefinedBreakpoints().tabletNormal) {
          return _buildHeaderImage(
            devImageWidth: contentWidth,
            devImageHeight: contentHeight,
//            globeImageWidth: 20,
//            globeImageHeight: 20,
          );
        } else if (screenWidth >= RefinedBreakpoints().desktopNormal) {
          return _buildHeaderImage(devImageHeight: contentHeight);
        } else {
          return _buildHeaderImage(
            devImageWidth: contentWidth,
            devImageHeight: contentHeight,
          );
        }
      },
    );
  }

  List<Widget> _buildCardRow({
    required List<NimBusCardData> data,
    required double width,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        NimBusCard(
          width: width / 4,
          height: 100,
          leading: CircularContainer(
            width: Sizes.WIDTH_40,
            height: Sizes.HEIGHT_40,
            iconSize: Sizes.ICON_SIZE_24,
            backgroundColor: data[index].circleBgColor,
            iconColor: data[index].leadingIconColor,
          ),
          title: SelectableText(
            data[index].title,
            style: textTheme.subtitle1?.copyWith(),
          ),
          subtitle: SelectableText(
            data[index].subtitle,
            style: textTheme.bodyText1,
          ),
          trailing: Icon(
            Icons.chevron_right,
            size: Sizes.ICON_SIZE_30,
            color: data[index].trailingIconColor,
          ),
        ),
      );
      items.add(SpaceW40());
    }

    return items;
  }
}
