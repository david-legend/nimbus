import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/blog_card.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

const double kSpacing = 16.0;
const double kRunSpacing = 16.0;

//TODO:: Add proper fontSize, fontFamily, and colors
//TODO:: Fix View All Button Designs
//TODO:: Add animation for readMore Button
//TODO:: Add proper Sizes for images etc.

class BlogSection extends StatefulWidget {
  @override
  _BlogSectionState createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSection> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth;
    double contentAreaHeight = screenHeight * 1.0;
    double blogWidth = contentAreaWidth * 0.6;

    return ContentArea(
      width: contentAreaWidth,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ContentArea(
                width: blogWidth,
                child: NimbusInfoSection(
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
          ),
          SpaceH20(),
          Wrap(
            spacing: kSpacing,
            runSpacing: kRunSpacing,
            children: _buildBlogCards(
              blogData: Data.blogData,
              width: contentAreaWidth,
            ),
          ),
        ],
      ),
    );
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
}
