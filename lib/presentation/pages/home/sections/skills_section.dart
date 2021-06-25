import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/skill_card.dart';
import 'package:nimbus/presentation/widgets/skill_level.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

const double kRunSpacing = 20.0;
const double kMainAxisSpacing = 16.0;
const double kCrossAxisSpacing = 16.0;
const double boxHeightSm = 150;

//TODO:: Stop hardcoding height values and find a dynamic way to let content grow
//TODO:: Add animation to load skillLevel
//TODO:: Add animation onHover of skillBoxes
//TODO:: Add proper background Blobs

class SkillsSection extends StatefulWidget {
  @override
  _SkillsSectionState createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
//  GlobalKey skillsSectionKey = GlobalKey();
//  GlobalKey skillBoxesKey = GlobalKey();
//  late double skillsSectionHeight;
//  late double skillBoxesHeight;
//  late double containerHeight;

  @override
  void initState() {
//    WidgetsBinding.instance!.addPostFrameCallback((_) {
//      _getHeightOfRoleLeaf();
//    });
    super.initState();
  }

//  _getHeightOfRoleLeaf() {
//    final RenderBox skillSectionRenderBox =
//        skillsSectionKey.currentContext!.findRenderObject() as RenderBox;
//    final RenderBox skillBoxesRenderBox =
//        skillBoxesKey.currentContext!.findRenderObject() as RenderBox;
//    final skillHeight = skillSectionRenderBox.size.height;
//    final boxHeight = skillBoxesRenderBox.size.height;
//    setState(() {
//      skillsSectionHeight = skillHeight;
//      skillBoxesHeight = boxHeight;
//      containerHeight = boxHeight + skillHeight;
//      print(
//          "SKILLS: $skillsSectionHeight, BOXES: $skillBoxesHeight, Container: $containerHeight ");
//    });
//  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth =
        responsiveSize(context, screenWidth, screenWidth * 0.5);
    double contentAreaHeight = screenHeight * 1.6;
    return Container(
      height: contentAreaHeight,
      child: ResponsiveBuilder(
          refinedBreakpoints: RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < (RefinedBreakpoints().tabletLarge)) {
              return Column(
                children: [
                  ContentArea(
//                    key: skillsSectionKey,
//                    backgroundColor: Colors.amber,
                    width: contentAreaWidth,
                    height: contentAreaHeight * 0.4,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: _buildNimbusSm(width: contentAreaWidth),
                  ),
                  Flexible(
                    child: ContentArea(
//                      key: skillBoxesKey,
                      width: contentAreaWidth,
                      padding:
                          EdgeInsets.symmetric(horizontal: Sizes.HEIGHT_48),
                      child: Center(
                        child: _buildSkillBoxes(
                          boxHeight: boxHeightSm,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  ContentArea(
                    width: contentAreaWidth,
                    height: contentAreaHeight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: _buildNimbusLg(width: contentAreaWidth),
                    ),
                  ),
                  ContentArea(
                    width: contentAreaWidth,
                    height: contentAreaHeight,
                    padding: EdgeInsets.symmetric(horizontal: Sizes.HEIGHT_48),
                    child: Center(
                      child: _buildSkillBoxes(
                        boxHeight: contentAreaHeight / 2.6,
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
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
  }) {
    int crosAxisCount = responsiveSizeInt(context, 1, 2);
    double invisibleBoxHeight = responsiveSize(context, 0, 10);
    return Container(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: crosAxisCount,
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

  Widget _buildNimbusLg({required double width}) {
    return Container(
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
                      width,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNimbusSm({required double width}) {
    return NimbusInfoSection2(
      sectionTitle: StringConst.MY_SKILLS,
      title1: StringConst.SKILLS_TITLE_1,
      title2: StringConst.SKILLS_TITLE_2,
      body: StringConst.SKILLS_DESC,
      child: Wrap(
        runSpacing: kRunSpacing,
        children: _buildSkillSection(
          Data.skillLevelData,
          width,
        ),
      ),
    );
  }
}
