import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nimbus/presentation/widgets/skill_card.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

//TODO:: Add proper brand images (add proper child)
//TODO:: Add proper fontSize, fontFamily, and colors
//TODO:: Add proper elevation for card
//TODO:: Add animation for sliding brand cards
//TODO:: Add proper background blobs

class BrandSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      child: Column(
        children: [
          Text(
            StringConst.BRANDS_SECTION_TITLE,
            style: textTheme.headline4,
          ),
          SpaceH20(),
          Container(
            height: 160,
            child: ListView.separated(
              padding: EdgeInsets.only(left: Sizes.PADDING_40),
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              separatorBuilder: (context, index) {
                return SpaceW20();
              },
              itemBuilder: (context, index) {
                return SkillCard(
                  width: 200,
                  height: 160,
                  iconData: FontAwesomeIcons.twitter,
                  title: "Brand",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
