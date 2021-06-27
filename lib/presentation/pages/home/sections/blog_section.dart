import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/blog_card.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

const double kSpacing = 16.0;
const double kRunSpacing = 16.0;

//TODO:: Add right padding for all views
//TODO:: Fix View All Button Designs
//TODO:: Add animation for readMore Button
//TODO:: Add proper Sizes for images etc.

class BlogSection extends StatefulWidget {
  @override
  _BlogSectionState createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSection> {
  final int blogLength = Data.blogData.length;
  double currentPageIndex = 0;
  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth =
        responsiveSize(context, screenWidth, screenWidth * 0.6);
    double blogImageHeight =
        responsiveSize(context, screenHeight * 0.8, screenHeight * 0.5);

    return ContentArea(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: Column(
        children: [
          ResponsiveBuilder(builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth <= (RefinedBreakpoints().tabletSmall)) {
              return Column(
                children: [
                  ContentArea(
                    width: contentAreaWidth,
                    child: NimbusInfoSection2(
                      sectionTitle: StringConst.MY_BLOG,
                      title1: StringConst.BLOG_SECTION_TITLE_1,
                      title2: StringConst.BLOG_SECTION_TITLE_2,
                      body: StringConst.BLOG_DESC,
                    ),
                  ),
                  SpaceH50(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: NimbusButton(
                      buttonTitle: StringConst.BLOG_VIEW_ALL,
                      buttonColor: AppColors.primaryColor,
                      onPressed: () {},
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ContentArea(
                    width: screenWidth * 0.7,
                    child: NimbusInfoSection1(
                      sectionTitle: StringConst.MY_BLOG,
                      title1: StringConst.BLOG_SECTION_TITLE_1,
                      title2: StringConst.BLOG_SECTION_TITLE_2,
                      body: StringConst.BLOG_DESC,
                    ),
                  ),
                  Spacer(),
                  NimbusButton(
                    buttonTitle: StringConst.BLOG_VIEW_ALL,
                    buttonColor: AppColors.primaryColor,
                    onPressed: () {},
                  ),
                  Spacer(),
                ],
              );
            }
          }),
          SpaceH20(),
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
//              print("SCREEN WIDTH:: $screenWidth");
              if (screenWidth < (RefinedBreakpoints().tabletLarge + 50)) {
//                print("SMALLEST:: $screenWidth");
                return Container(
                  width: screenWidth,
                  height: blogImageHeight,
                  child: CarouselSlider.builder(
                    itemCount: blogLength,
                    itemBuilder:
                        (BuildContext context, int index, int pageViewIndex) {
                      return BlogCard(
                        width: contentAreaWidth * 0.8,
                        height: blogImageHeight,
                        category: Data.blogData[index].category,
                        title: Data.blogData[index].title,
                        date: Data.blogData[index].date,
                        buttonText: Data.blogData[index].buttonText,
                        imageUrl: Data.blogData[index].imageUrl,
                        onPressed: () {},
                      );
                    },
                    options: carouselOptions(),
                  ),
                );
              } else if (screenWidth >= RefinedBreakpoints().tabletExtraLarge &&
                  screenWidth <= 1400) {
//                print("MIDDLE:: $screenWidth");
                return Container(
                  height: screenHeight,
                  width: screenWidth,
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth,
                        height: screenHeight * 0.8,
                        child: CarouselSlider.builder(
                          itemCount: blogLength,
                          carouselController: _carouselController,
                          itemBuilder: (BuildContext context, int index,
                              int pageViewIndex) {
                            return BlogCard(
                              width: screenWidth * 0.3,
                              height: blogImageHeight,
                              category: Data.blogData[index].category,
                              title: Data.blogData[index].title,
                              date: Data.blogData[index].date,
                              buttonText: Data.blogData[index].buttonText,
                              imageUrl: Data.blogData[index].imageUrl,
                              onPressed: () {},
                            );
                          },
                          options: carouselOptions(
                            viewportFraction: 0.5,
                            autoPlay: false,
//                            enableInfiniteScroll: false,
                          ),
                        ),
                      ),
//                      SpaceH20(),
                      _buildDotsIndicator(
                        pageLength: blogLength,
                        currentIndex: currentPageIndex,
                      ),
                    ],
                  ),
                );
              } else {
                return Wrap(
                  spacing: kSpacing,
                  runSpacing: kRunSpacing,
                  children: _buildBlogCards(
                    blogData: Data.blogData,
                    width: screenWidth,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  CarouselOptions carouselOptions({
    bool autoPlay = true,
    bool enlargeCenterPage = false,
    bool enableInfiniteScroll = true,
    double viewportFraction = 1.0,
    double aspectRatio = 0.1,
    int initialPage = 2,
    ScrollPhysics? scrollPhysics = const NeverScrollableScrollPhysics(),
  }) {
    return CarouselOptions(
        autoPlay: autoPlay,
        enableInfiniteScroll: enableInfiniteScroll,
        enlargeCenterPage: enlargeCenterPage,
        viewportFraction: viewportFraction,
        aspectRatio: aspectRatio,
        initialPage: initialPage,
        scrollPhysics: scrollPhysics,
        onPageChanged: (int index, CarouselPageChangedReason reason) {
          setState(() {
            currentPageIndex = index.toDouble();
          });
        });
  }

  List<Widget> _buildBlogCards({
    required List<BlogCardData> blogData,
    required double width,
  }) {
    double cardWidth = (width - (kSpacing * 2)) / 3;
    List<Widget> items = [];

    for (int index = 0; index < blogData.length; index++) {
      items.add(
        BlogCard(
          width: cardWidth,
          category: blogData[index].category,
          title: blogData[index].title,
          date: blogData[index].date,
          buttonText: blogData[index].buttonText,
          imageUrl: blogData[index].imageUrl,
          onPressed: () {},
        ),
      );
    }
    return items;
  }

  Widget _buildDotsIndicator({
    required int pageLength,
    required double currentIndex,
  }) {
    return Container(
      child: DotsIndicator(
        dotsCount: pageLength,
        position: currentIndex,
        onTap: (index) {
          _moveToNextCarousel(index.toInt());
        },
        decorator: DotsDecorator(
          color: AppColors.yellow10,
          activeColor: AppColors.yellow400,
          size: Size(Sizes.SIZE_6, Sizes.SIZE_6),
          activeSize: Size(Sizes.SIZE_24, Sizes.SIZE_6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              const Radius.circular(Sizes.RADIUS_8),
            ),
          ),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              const Radius.circular(Sizes.RADIUS_8),
            ),
          ),
          spacing: EdgeInsets.symmetric(horizontal: Sizes.SIZE_4),
        ),
      ),
    );
  }

  _moveToNextCarousel(int index) {
    setState(() {
      currentPageIndex = index.toDouble();
      _carouselController.animateToPage(index);
    });
  }
}
