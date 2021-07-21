import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/pages/home/sections/header_section/widgets.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/utils/functions.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

//TODO:: Later
//TODO:: Add background ash blobs
//TODO:: Animation to button. (Channel your adventurous self)

const double bodyTextSizeLg = 16.0;
const double bodyTextSizeSm = 14.0;
const double socialTextSizeLg = 18.0;
const double socialTextSizeSm = 14.0;
// const double sidePadding = Sizes.PADDING_16;

class HeaderSectionWeb extends StatefulWidget {
  @override
  _HeaderSectionWebState createState() => _HeaderSectionWebState();
}

class _HeaderSectionWebState extends State<HeaderSectionWeb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
    TextTheme textTheme = Theme.of(context).textTheme;
    double sidePadding = getSidePadding(context);
    double headerIntroTextSize = responsiveSize(
      context,
      Sizes.TEXT_SIZE_24,
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
    double contentAreaHeight = screenHeight * 0.8;
    double widthOfBlackBlob = contentAreaWidth * 0.5;
    double hiddenPortionOfBlackBlob = widthOfBlackBlob * 0.95;
    TextStyle? bodyTextStyle =
        textTheme.bodyText1?.copyWith(fontSize: bodyTextSize);
    TextStyle? socialTitleStyle =
        textTheme.subtitle1?.copyWith(fontSize: socialTextSize);

    List<Widget> cardsForTabletView = buildCardRow(
      context: context,
      data: Data.nimbusCardData,
      width: contentAreaWidth * 0.4,
      isWrap: true,
    );
    double buttonWidth = responsiveSize(
      context,
      80,
      150,
    );
    double buttonHeight = responsiveSize(
      context,
      48,
      60,
      md: 54,
    );

    double sizeOfBlobSm = screenWidth * 0.3;
    double sizeOfGoldenGlobe = screenWidth * 0.2;
    double dottedGoldenGlobeOffset = sizeOfBlobSm * 0.4;
    double heightOfBlobAndGlobe =
        computeHeight(dottedGoldenGlobeOffset, sizeOfGoldenGlobe, sizeOfBlobSm);
    double heightOfStack = heightOfBlobAndGlobe * 2;
    double blobOffset = heightOfStack * 0.3;
    return ContentArea(
      child: Stack(
        children: [
          Container(
            height: heightOfStack,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Positioned(
                      left: -(sizeOfBlobSm * 0.7),
                      top: blobOffset,
                      child: Image.asset(
                        ImagePath.BLOB_BLACK,
                        height: sizeOfBlobSm,
                        width: sizeOfBlobSm,
                      ),
                    ),
                    Positioned(
                      left: -(sizeOfGoldenGlobe * 0.5),
                      top: blobOffset + dottedGoldenGlobeOffset,
                      child: RotationTransition(
                        turns: _controller,
                        child: Image.asset(
                          ImagePath.DOTS_GLOBE_YELLOW,
                          width: sizeOfGoldenGlobe,
                          height: sizeOfGoldenGlobe,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: -(sizeOfBlobSm* 0.8),
                  child: HeaderImage(
                    controller: _controller,
                    globeSize: sizeOfGoldenGlobe,
                    imageHeight: heightOfStack,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: heightOfStack * 0.05),
                    child: SelectableText(
                      StringConst.FIRST_NAME,
                      style: textTheme.headline1?.copyWith(
                        color: AppColors.grey50,
                        fontSize: headerIntroTextSize * 2,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: heightOfStack * 0.2, left: (sizeOfBlobSm * 0.35)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: screenWidth),
                              child: AnimatedTextKit(
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
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: screenWidth),
                              child: AnimatedTextKit(
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
                            ),
                            SpaceH16(),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: screenWidth * 0.35),
                              child: SelectableText(
                                StringConst.ABOUT_DEV,
                                style: bodyTextStyle?.copyWith(height: 1.5),
                              ),
                            ),
                            SpaceH30(),
                            Wrap(
                              // mainAxisSize: MainAxisSize.min,
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
                                SpaceW16(),
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
                                  width: buttonWidth,
                                  height: buttonHeight,
                                  buttonTitle: StringConst.DOWNLOAD_CV,
                                  buttonColor: AppColors.primaryColor,
                                  onPressed: () {},
                                ),
                                SpaceW16(),
                                NimbusButton(
                                  width: buttonWidth,
                                  height: buttonHeight,
                                  buttonTitle: StringConst.HIRE_ME_NOW,
                                  onPressed: () =>
                                      openUrlLink(StringConst.EMAIL_URL),
                                ),
                              ],
                            ),
                            SpaceH30(),
                            Wrap(
                              children: buildSocialIcons(Data.socialData),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 150),
              Container(
                margin: EdgeInsets.only(left: (sizeOfBlobSm * 0.35)),
                child: ResponsiveBuilder(
                  refinedBreakpoints: RefinedBreakpoints(),
                  builder: (context, sizingInformation) {
                    double screenWidth = sizingInformation.screenSize.width;
                    if (screenWidth < RefinedBreakpoints().tabletNormal) {
                      return Container(
                         margin: EdgeInsets.only(right: (sizeOfBlobSm * 0.35)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildCardRow(
                            context: context,
                            data: Data.nimbusCardData,
                            width: contentAreaWidth,
                            isHorizontal: false,
                            hasAnimation: false,
                          ),
                        ),
                      );
                    }else if (screenWidth >=
                            RefinedBreakpoints().tabletNormal &&
                        screenWidth <= 1024) {
                      return Wrap(
                        runSpacing: 24,
                        children: [
                          SizedBox(width: contentAreaWidth * 0.03),
                          cardsForTabletView[0],
                          SpaceW40(),
                          cardsForTabletView[1],
                          SizedBox(width: contentAreaWidth * 0.03),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: cardsForTabletView[2],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ...buildCardRow(
                                context: context,
                                data: Data.nimbusCardData,
                                width: contentAreaWidth / 3.8,
                              ),
                              Spacer(),
                            ],
                          ),
                        ],
                      );
                    } 
                  },
                ),
              ),
            ],
          ),
        ],
      ),
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
                child: HeaderImage(
                  controller: _controller,
                  fit: BoxFit.cover,
                ),
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
                child: HeaderImage(
                  controller: _controller,
                  globeSize: 200,
                  fit: BoxFit.cover,
                ),
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
                child: HeaderImage(
                  controller: _controller,
                  globeSize: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
