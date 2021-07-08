import 'package:animated_text_kit/animated_text_kit.dart';
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

//TODO:: Priority
//TODO:: Position cards at right position with right spacing (in between them)
//TODO:: Add animation to cards

//TODO:: Later
//TODO:: Fix text Sizes when resized to mobile after using animated_text_kit
//TODO:: Add background ash blobs
//TODO:: Animation to button. (Channel your adventurous self)

const double bodyTextSizeLg = 16.0;
const double bodyTextSizeSm = 14.0;
const double socialTextSizeLg = 18.0;
const double socialTextSizeSm = 14.0;

class HeaderSection extends StatefulWidget {
  @override
  _HeaderSectionState createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _controller.addStatusListener((status) {
        _controller.forward();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
    Color headerTextColor =
        responsiveColor(context, AppColors.black, AppColors.primaryColor);
    double bodyTextSize =
        responsiveSize(context, bodyTextSizeSm, bodyTextSizeLg);
    double socialTextSize =
        responsiveSize(context, socialTextSizeSm, socialTextSizeLg);
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth;
    double contentAreaHeight = screenHeight * 0.8;
    double widthOfBlackBlob = contentAreaWidth * 0.5;
    double hiddenPortionOfBlackBlob = widthOfBlackBlob * 0.95;
    TextStyle? bodyTextStyle =
        textTheme.bodyText1?.copyWith(fontSize: bodyTextSize);
    TextStyle? socialTitleStyle =
        textTheme.subtitle1?.copyWith(fontSize: socialTextSize);
    return ContentArea(
      width: contentAreaWidth,
//      height: contentAreaHeight,
      child: Column(
        children: [
          Stack(
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
              Container(
                height: screenHeight,
                child: _buildResponsiveHeaderImage(),
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
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              StringConst.INTRO,
                              speed: Duration(milliseconds: 60),
                              textStyle: textTheme.headline2?.copyWith(
                                fontSize: headerIntroTextSize,
                              ),
                            ),
                          ],
                          onTap: () {},
                          isRepeatingAnimation: true,
                          totalRepeatCount: 5,
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              StringConst.POSITION,
                              speed: Duration(milliseconds: 80),
                              textStyle: textTheme.headline2?.copyWith(
                                fontSize: headerIntroTextSize,
                                color: AppColors.primaryColor,
                                height: 1.2,
                              ),
                            ),
                          ],
                          onTap: () {},
                          isRepeatingAnimation: true,
                          totalRepeatCount: 5,
                        ),
//                    SelectableText(
//                      StringConst.INTRO,
//                      style: textTheme.headline2?.copyWith(
//                        fontSize: headerIntroTextSize,
//                      ),
//                    ),
//                    SelectableText(
//                      StringConst.POSITION,
//                      style: textTheme.headline2?.copyWith(
//                        fontSize: headerIntroTextSize,
//                        color: AppColors.primaryColor,
//                        height: 1.2,
//                      ),
//                    ),
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
                              onPressed: () =>
                                  openUrlLink(StringConst.EMAIL_URL),
                            ),
                            SpaceW20(),
                            NimbusButton(
                              buttonTitle: StringConst.HIRE_ME_NOW,
                              onPressed: () =>
                                  openUrlLink(StringConst.EMAIL_URL),
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
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
            child: Column(
              children: [
                ResponsiveBuilder(
                    refinedBreakpoints: RefinedBreakpoints(),
                    builder: (context, sizingInformation) {
                      double screenWidth = sizingInformation.screenSize.width;
                      if (screenWidth > RefinedBreakpoints().tabletExtraLarge) {
                        return Column(
                          children: [
                            Spacer(),
                            Row(
                              children: [
                                Spacer(),
                                ..._buildCardRow(
                                  data: Data.nimbusCardData,
                                  width: contentAreaWidth / 4,
                                ),
                                Spacer(),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: _buildCardRow(
                            data: Data.nimbusCardData,
                            width: contentAreaWidth,
                            isHorizontal: false,
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
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

  Widget _buildHeaderImage({double dotsGlobeSize = 150}) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          child: RotationTransition(
            turns: _controller,
            child: Image.asset(
              ImagePath.DOTS_GLOBE_GREY,
              height: dotsGlobeSize,
              width: dotsGlobeSize,
            ),
          ),
        ),
        Image.asset(
          ImagePath.DEV_HEADER,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildResponsiveHeaderImage() {
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth < RefinedBreakpoints().tabletSmall) {
          return Align(
            alignment: Alignment(5, -1.0),
            child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Align(
                alignment: Alignment(5, -1.0),
                child: _buildHeaderImage(),
              ),
            ),
          );
        } else if (screenWidth >= RefinedBreakpoints().tabletSmall &&
            screenWidth <= RefinedBreakpoints().tabletExtraLarge) {
          return Align(
            alignment: Alignment(2, -1.0),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Align(
                alignment: Alignment(2, -1.0),
                child: _buildHeaderImage(dotsGlobeSize: 200),
              ),
            ),
          );
        } else {
          return Align(
            alignment: Alignment(1.5, -1.5),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Align(
                alignment: Alignment(1.5, -1.5),
                child: _buildHeaderImage(dotsGlobeSize: 250),
              ),
            ),
          );
        }
      },
    );
  }

  List<Widget> _buildCardRow({
    required List<NimBusCardData> data,
    required double width,
    bool isHorizontal = true,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        NimBusCard(
          width: width,
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
      if (isHorizontal) {
        items.add(SpaceW40());
      } else {
        items.add(SpaceH40());
      }
    }

    return items;
  }
}
