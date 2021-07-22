import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/project_item.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

const double kSpacing = 20.0;
const double kRunSpacing = 16.0;

class ProjectCategoryData {
  final String title;
  final int number;
  bool isSelected;

  ProjectCategoryData({
    required this.title,
    required this.number,
    this.isSelected = false,
  });
}

class ProjectsSection extends StatefulWidget {
  ProjectsSection({Key? key});

  @override
  _ProjectsSectionState createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _projectController;
  late Animation<double> _projectScaleAnimation;
  List<List<ProjectData>> projects = [
    Data.allProjects,
    Data.branding,
    Data.packaging,
    Data.photograhy,
    Data.webDesign,
  ];
  late List<ProjectData> selectedProject;
  late List<ProjectCategoryData> projectCategories;

  @override
  void initState() {
    super.initState();
    selectedProject = projects[0];
    projectCategories = Data.projectCategories;
    _projectController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _projectScaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _projectController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    _projectController.dispose();
    super.dispose();
  }

  Future<void> _playProjectAnimation() async {
    try {
      await _projectController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double contentAreaWidth = screenWidth;
    return VisibilityDetector(
      key: Key('project-section'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 40) {
          _playProjectAnimation();
        }
      },
      child: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth < (RefinedBreakpoints().tabletLarge)) {
            return Container(
              padding:
                  EdgeInsets.symmetric(horizontal: getSidePadding(context)),
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
                    //                  children: _buildProjectCategories(projectCategories),
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
                    children: _buildProjects(selectedProject),
                  ),
                ),
              ],
            );
          }
        },
      ),
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
        children: _buildProjectCategories(projectCategories),
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
          isSelected: categories[index].isSelected,
          onTap: () => onProjectCategoryTap(index),
        ),
      );
    }
    return items;
  }

  List<Widget> _buildProjects(List<ProjectData> data) {
    List<Widget> items = [];
    for (int index = 0; index < data.length; index++) {
      items.add(
        ScaleTransition(
          scale: _projectScaleAnimation,
          child: ProjectItem(
            width: assignWidth(context, data[index].width),
            height: assignHeight(context, data[index].height),
            title: data[index].title,
            subtitle: data[index].category,
            imageUrl: data[index].projectCoverUrl,
          ),
        ),
      );
    }

    return items;
  }

  void onProjectCategoryTap(index) {
    _projectController.reset();
    changeCategorySelected(index);
    setState(() {
      selectedProject = projects[index];
      _playProjectAnimation();
    });
  }

  changeCategorySelected(int selectedIndex) {
    for (int index = 0; index < projectCategories.length; index++) {
      if (index == selectedIndex) {
        setState(() {
          projectCategories[selectedIndex].isSelected = true;
        });
      } else {
        projectCategories[index].isSelected = false;
      }
    }
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
    this.onTap,
    this.isSelected = false,
  });

  final String title;
  final Color titleColor;
  final Color numberColor;
  final TextStyle? titleStyle;
  final int number;
  final Color hoverColor;
  final TextStyle? numberStyle;
  final GestureTapCallback? onTap;
  final bool isSelected;

  @override
  _ProjectCategoryState createState() => _ProjectCategoryState();
}

class _ProjectCategoryState extends State<ProjectCategory>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController _controller;
  late Animation<double> opacity;
  late Animation<Color?> textColor;
  late Color color;

  @override
  void initState() {
    super.initState();
    color = widget.titleColor;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 450),
    );

    // textColor =
    //     ColorTween(begin: widget.titleColor, end: widget.hoverColor).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: Curves.easeIn,
    //   ),
    // );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: InkWell(
        onTap: widget.onTap,
        hoverColor: Colors.transparent,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.title,
                style: widget.titleStyle?.copyWith(
                      color: colorOfCategory(),
                    ) ??
                    textTheme.subtitle1?.copyWith(
                      fontSize: Sizes.TEXT_SIZE_16,
                      color: colorOfCategory(),
                    ),
              ),
              WidgetSpan(
                child: widget.isSelected
                    ? numberOfProjectItems()
                    : FadeTransition(
                        opacity: _controller.view,
                        child: numberOfProjectItems(),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget numberOfProjectItems() {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Transform.translate(
      offset: const Offset(2, -8),
      child: Text(
        "(${widget.number})",
        textScaleFactor: 0.7,
        style: widget.numberStyle?.copyWith(
              color: widget.hoverColor,
            ) ??
            textTheme.subtitle1?.copyWith(
              fontSize: Sizes.TEXT_SIZE_16,
              color: widget.hoverColor,
            ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
    if (hovering) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  Color colorOfSuperScript() {
    if (_isHovering) {
      return widget.hoverColor;
    } else if (widget.isSelected) {
      return widget.hoverColor;
    } else {
      return widget.numberColor;
    }
  }

  Color colorOfCategory() {
    if (_isHovering) {
      return widget.hoverColor;
    } else if (widget.isSelected) {
      return widget.hoverColor;
    } else {
      return widget.titleColor;
    }
  }
}
