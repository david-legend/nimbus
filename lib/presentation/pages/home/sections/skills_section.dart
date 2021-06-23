import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/skill_card.dart';
import 'package:nimbus/presentation/widgets/skill_level.dart';
import 'package:nimbus/values/values.dart';

const double kRunSpacing = 20.0;
const double kMainAxisSpacing = 16.0;
const double kCrossAxisSpacing = 16.0;
const double invisibleBoxHeight = 10;

//TODO:: Add animation to load skillLevel
//TODO:: Add animation onHover of skillBoxes
//TODO:: Add right fontSizes and fontFamilies
//TODO:: Add right colors of texts and icons for skillBoxes
//TODO:: Add proper background Blobs

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth * 0.5;
    double contentAreaHeight = screenHeight * 0.9;
    return Container(
      child: Row(
        children: [
          ContentArea(
            width: contentAreaWidth,
            height: contentAreaHeight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        NimbusInfoSection1(
                          sectionTitle: StringConst.MY_SKILLS,
                          title1: StringConst.SKILLS_TITLE_1,
                          title2: StringConst.SKILLS_TITLE_2,
                          body: StringConst.SKILLS_DESC,
                          child: Wrap(
                            runSpacing: kRunSpacing,
                            children: _buildSkillSection(
                              Data.skillLevelData,
                              contentAreaWidth,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ContentArea(
            width: contentAreaWidth,
            height: contentAreaHeight,
            padding: EdgeInsets.symmetric(horizontal: Sizes.HEIGHT_48),
            child: Center(
              child: _buildSkillBoxes(
                boxHeight: contentAreaHeight / 2.6,
                invisibleBoxHeight: invisibleBoxHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSkillSection(
    List<SkillLevelData> skillLevels,
    double width,
  ) {
    List<Widget> items = [];
    for (int index = 0; index < skillLevels.length; index++) {
      items.add(
        SkillLevel(
          skillLevelWidth: width,
          skill: skillLevels[index].skill,
          level: skillLevels[index].level,
        ),
      );
    }
    return items;
  }

  Widget _buildSkillBoxes({
    required double boxHeight,
    required invisibleBoxHeight,
  }) {
    return Container(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: Data.skillCardData.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (index == 1 || index == 5) {
            return Container(color: Colors.transparent);
          } else {
            return SkillCard(
              title: Data.skillCardData[index].title,
              iconData: Data.skillCardData[index].iconData,
            );
          }
        },
        staggeredTileBuilder: (int index) {
          if (index == 1 || index == 5) {
            return StaggeredTile.extent(1, invisibleBoxHeight);
          } else {
            return StaggeredTile.extent(1, boxHeight);
          }
        },
        mainAxisSpacing: kMainAxisSpacing,
        crossAxisSpacing: kCrossAxisSpacing,
      ),
    );
  }
}
