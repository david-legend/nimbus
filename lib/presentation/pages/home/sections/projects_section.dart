import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/project_item.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

//TODO:: Add proper fontFamilies and styles
//TODO:: Add project slides and tabs
//TODO:: Add proper padding and arrangements of screens

const double kSpacing = 20.0;
const double kRunSpacing = 16.0;

class ProjectCategoryData {
  final String title;
  final int number;

  ProjectCategoryData({required this.title, required this.number});
}

class ProjectsSection extends StatefulWidget {
  ProjectsSection({Key? key});

  @override
  _ProjectsSectionState createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _fadeInController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    );
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scaleController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth;
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;
        if (screenWidth < (RefinedBreakpoints().tabletLarge)) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                children: [
                  _buildNimbusInfoSectionSm(),
                  SpaceH40(),
                  NimbusButton(
                    buttonTitle: StringConst.ALL_PROJECTS,
                    buttonColor: AppColors.primaryColor,
                    onPressed: () {},
                  ),
                  SpaceH40(),
                  //                Wrap(
                  //                  spacing: kSpacing,
                  //                  runSpacing: kRunSpacing,
                  //                  children: _buildProjectCategories(Data.projectCategories),
                  //                )
                ],
              ),
            ),
          );
        } else {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: getSidePadding(context),
                ),
                child: ContentArea(
                  width: contentAreaWidth,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ContentArea(
                        width: contentAreaWidth * 0.6,
                        child: _buildNimbusInfoSectionLg(),
                      ),
                      Spacer(),
                      NimbusButton(
                        buttonTitle: StringConst.ALL_PROJECTS,
                        buttonColor: AppColors.primaryColor,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SpaceH40(),
              Container(
                width: widthOfScreen(context),
                child: Wrap(
                  spacing: assignWidth(context, 0.025),
                  runSpacing: assignWidth(context, 0.025),
                  children: _buildProjects(Data.allProjects),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildNimbusInfoSectionSm() {
    return NimbusInfoSection2(
      sectionTitle: StringConst.MY_WORKS,
      title1: StringConst.MEET_MY_PROJECTS,
      hasTitle2: false,
      body: StringConst.PROJECTS_DESC,
//      child: ,
    );
  }

  Widget _buildNimbusInfoSectionLg() {
    return NimbusInfoSection1(
      sectionTitle: StringConst.MY_WORKS,
      title1: StringConst.MEET_MY_PROJECTS,
      hasTitle2: false,
      body: StringConst.PROJECTS_DESC,
      child: Wrap(
        spacing: kSpacing,
        runSpacing: kRunSpacing,
        children: _buildProjectCategories(Data.projectCategories),
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

  List<Widget> _buildProjects(List<ProjectData> data) {
    List<Widget> items = [];
    for (int index = 0; index < data.length; index++) {
      items.add(
        ProjectItem(
          controller: _scaleController,
          width: assignWidth(context, data[index].width),
          height: assignHeight(context, data[index].height),
          title: data[index].title,
          subtitle: data[index].category,
          imageUrl: data[index].projectCoverUrl,
        ),
      );
    }

    return items;
  }
}

class ProjectCategory extends StatefulWidget {
  ProjectCategory({
    required this.title,
    required this.number,
    this.titleColor = AppColors.black,
    this.numberColor = Colors.transparent,
    this.hoverColor = AppColors.primaryColor,
    this.titleStyle,
    this.numberStyle,
  });

  final String title;
  final Color titleColor;
  final Color numberColor;
  final TextStyle? titleStyle;
  final int number;
  final Color hoverColor;
  final TextStyle? numberStyle;

  @override
  _ProjectCategoryState createState() => _ProjectCategoryState();
}

class _ProjectCategoryState extends State<ProjectCategory> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return MouseRegion(
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.title,
                style: widget.titleStyle?.copyWith(
                      color:
                          _isHovering ? widget.hoverColor : widget.titleColor,
                    ) ??
                    textTheme.subtitle1?.copyWith(
                      fontSize: Sizes.TEXT_SIZE_16,
                      color:
                          _isHovering ? widget.hoverColor : widget.titleColor,
                    ),
              ),
              WidgetSpan(
                child: Transform.translate(
                  offset: const Offset(2, -8),
                  child: Text(
                    "(${widget.number})",
                    textScaleFactor: 0.7,
                    style: widget.numberStyle?.copyWith(
                          color: _isHovering
                              ? widget.hoverColor
                              : widget.numberColor,
                        ) ??
                        textTheme.subtitle1?.copyWith(
                          fontSize: Sizes.TEXT_SIZE_16,
                          color: _isHovering
                              ? widget.hoverColor
                              : widget.numberColor,
                        ),
                  ),
                ),
              )
            ],
          ),
        )
        // Container(
        //   child: Text(
        //     widget.title,
        // style: widget.titleStyle?.copyWith(
        //       color: _isHovering ? widget.hoverColor : widget.titleColor,
        //     ) ??
        //     textTheme.subtitle1?.copyWith(
        //       fontSize: Sizes.TEXT_SIZE_16,
        //       color: _isHovering ? widget.hoverColor : widget.titleColor,
        //     ),
        //   ),
        // ),
        );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
  }
}
