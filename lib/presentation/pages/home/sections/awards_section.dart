import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/bullet_text.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

//TODO:: Add correct fontStyle, fontSizes, fontFamilies
//TODO:: Add yellow dots globe under image.
//TODO:: Add correct spacing and padding
//TODO:: Decide whether to add My CV on top of the dev image

class AwardsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth * 0.5;
    double contentAreaHeight = screenHeight * 0.9;
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      children: [
                        Spacer(),
                        NimbusInfoSection(
                          sectionTitle: StringConst.MY_AWARDS,
                          title1: StringConst.AWARDS_TITLE,
                          hasTitle2: false,
                          body: StringConst.AWARDS_DESC,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    StringConst.AWARDS_TYPE_TITLE_1,
                                    style: textTheme.headline6,
                                  ),
                                  SpaceH16(),
                                  ..._buildAwards(Data.awards1),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    StringConst.AWARDS_TYPE_TITLE_2,
                                    style: textTheme.headline6,
                                  ),
                                  SpaceH16(),
                                  ..._buildAwards(Data.awards1),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Spacer(flex: 2),
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
            child: Column(
              children: [
                Image.asset(
                  ImagePath.DEV_AWARD,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAwards(List<String> awards) {
    List<Widget> items = [];
    for (int index = 0; index < awards.length; index++) {
      items.add(TextWithBullet(text: awards[index]));
      items.add(SpaceH16());
    }
    return items;
  }
}
