import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/values/values.dart';

const double kSpacing = 16.0;
const double kRunSpacing = 16.0;

class BlogSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth;
    double contentAreaHeight = screenHeight * 0.5;
    return ContentArea(
      width: contentAreaWidth,
      height: contentAreaHeight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ContentArea(
            width: contentAreaWidth * 0.6,
            child: NimbusInfoSection(
              sectionTitle: StringConst.MY_BLOG,
              title1: StringConst.BLOG_SECTION_TITLE_1,
              title2: StringConst.BLOG_SECTION_TITLE_2,
              body: StringConst.BLOG_DESC,
//              child: Wrap(
//                spacing: kSpacing,
//                runSpacing: kRunSpacing,
//                children: _buildProjectCategories(Data.projectCategories),
//              ),
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
    );
  }
}
