import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/values/values.dart';

//TODO:: Add proper fontFamilies and styles
//TODO:: Add project slides and tabs
//TODO:: Add proper padding and arrangements of screens

const double kSpacing = 16.0;
const double kRunSpacing = 16.0;

class ProjectCategoryData {
  final String title;
  final int number;

  ProjectCategoryData({required this.title, required this.number});
}

class ProjectsSection extends StatelessWidget {
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
              sectionTitle: StringConst.MY_WORKS,
              title1: StringConst.MEET_MY_PROJECTS,
              hasTitle2: false,
              body: StringConst.PROJECTS_DESC,
              child: Wrap(
                spacing: kSpacing,
                runSpacing: kRunSpacing,
                children: _buildProjectCategories(Data.projectCategories),
              ),
            ),
          ),
          Spacer(),
          NimbusButton(
            buttonTitle: StringConst.ALL_PROJECTS,
            buttonColor: AppColors.primaryColor,
            onPressed: () {},
          ),
          Spacer(),
        ],
      ),
    );
  }

  List<Widget> _buildProjectCategories(List<ProjectCategoryData> categories) {
    List<Widget> items = [];

    for (int index = 0; index < categories.length; index++) {
      items.add(
        ProjectCategory(
          title: categories[index].title,
          number: categories[index].number,
        ),
      );
    }
    return items;
  }
}

class ProjectCategory extends StatelessWidget {
  ProjectCategory({
    required this.title,
    required this.number,
    this.titleColor = AppColors.black,
    this.numberColor = AppColors.primaryColor,
    this.titleStyle,
    this.numberStyle,
  });

  final String title;
  final Color titleColor;
  final TextStyle? titleStyle;
  final int number;
  final Color numberColor;
  final TextStyle? numberStyle;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      child: Text(
        title,
        style: titleStyle ?? textTheme.subtitle1,
      ),
    );
  }
}
