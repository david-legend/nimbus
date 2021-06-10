import 'package:flutter/material.dart';
import 'package:nimbus/presentation/pages/home/sections/about_me_section.dart';
import 'package:nimbus/presentation/pages/home/sections/header_section.dart';
import 'package:nimbus/presentation/pages/home/sections/nav_section/nav_section_mobile.dart';
import 'package:nimbus/presentation/pages/home/sections/nav_section/nav_section_web.dart';
import 'package:nimbus/presentation/pages/home/sections/skills_section.dart';
import 'package:nimbus/presentation/pages/home/sections/statistics_section.dart';
import 'package:nimbus/presentation/widgets/nav_item.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

//TODO:: Add ash background blob (esp the one that extends between header and about section
//TODO:: Add huge ash background blob (the one that extends between skills section and projects
//TODO:: Add FAB that takes user to the top page

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  final List<NavItemData> navItems = [
    NavItemData(name: StringConst.HOME, key: GlobalKey(), isSelected: true),
    NavItemData(name: StringConst.SERVICES, key: GlobalKey()),
    NavItemData(name: StringConst.ABOUT, key: GlobalKey()),
    NavItemData(name: StringConst.PROJECTS, key: GlobalKey()),
    NavItemData(name: StringConst.SKILLS, key: GlobalKey()),
    NavItemData(name: StringConst.CONTACT, key: GlobalKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              if (sizingInformation.isMobile) {
                return NavSectionMobile(scaffoldKey: _scaffoldKey);
              } else {
                return NavSectionWeb(
                  navItems: navItems,
                );
              }
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeaderSection(),
                  AboutMeSection(),
                  SkillsSection(),
                  StatisticsSection(),
                  SpaceH20(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
