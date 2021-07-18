import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/pages/home/sections/about_me_section.dart';
import 'package:nimbus/presentation/pages/home/sections/awards_section.dart';
import 'package:nimbus/presentation/pages/home/sections/blog_section.dart';
import 'package:nimbus/presentation/pages/home/sections/footer_section.dart';
import 'package:nimbus/presentation/pages/home/sections/header_section.dart';
import 'package:nimbus/presentation/pages/home/sections/nav_section/nav_section_mobile.dart';
import 'package:nimbus/presentation/pages/home/sections/nav_section/nav_section_web.dart';
import 'package:nimbus/presentation/pages/home/sections/projects_section.dart';
import 'package:nimbus/presentation/pages/home/sections/skills_section.dart';
import 'package:nimbus/presentation/pages/home/sections/statistics_section.dart';
import 'package:nimbus/presentation/widgets/app_drawer.dart';
import 'package:nimbus/presentation/widgets/nav_item.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
    double screenHeight = heightOfScreen(context);
    double spacerHeight = screenHeight * 0.10;

    return Scaffold(
      key: _scaffoldKey,
      drawer: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          if (sizingInformation.isMobile) {
            return AppDrawer(
              menuList: navItems,
            );
          } else {
            return Container();
          }
        },
      ),
      body: Column(
        children: [
          ResponsiveBuilder(
            refinedBreakpoints: RefinedBreakpoints(),
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth < RefinedBreakpoints().desktopSmall) {
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
                  SizedBox(height: spacerHeight),
                  AboutMeSection(),
                  SizedBox(height: spacerHeight),
                  SkillsSection(),
                  SizedBox(height: spacerHeight),
                  StatisticsSection(),
                  // SizedBox(height: spacerHeight),
                  // ProjectsSection(),
                  // SizedBox(height: spacerHeight),
                  // AwardsSection(),
                  // SizedBox(height: spacerHeight),
//                  BrandSection(),
//                  SizedBox(height: spacerHeight),
//                  TestimonialsSection(),
                  // SizedBox(height: spacerHeight),
                  // BlogSection(),
                  // SizedBox(height: spacerHeight),
                  // FooterSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
