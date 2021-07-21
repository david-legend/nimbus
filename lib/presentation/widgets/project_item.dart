import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class ProjectData {
  final String projectCoverUrl;
  final String title;
  final String category;
  final double width;
  final double height;

  ProjectData({
    required this.projectCoverUrl,
    required this.title,
    required this.category,
    required this.width,
    this.height = 0.4,
  });
}

class ProjectItem extends StatefulWidget {
  const ProjectItem({
    Key? key,
    required this.controller,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.width,
    this.height,
    this.titleStyle,
    this.subtitleStyle,
    this.textColor = AppColors.white,
    this.bannerColor,
    this.curve = Curves.fastOutSlowIn,
    this.tweenValues = const [0.0, 1],
  })  : assert(tweenValues.length == 2),
        super(key: key);

  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final String imageUrl;
  final Color? bannerColor;
  final Color textColor;
  final double width;
  final double? height;
  final AnimationController controller;
  final Curve curve;
  final List<double> tweenValues;

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _scaleAnimation = Tween(
      begin: widget.tweenValues[0],
      end: widget.tweenValues[1],
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: widget.curve,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color? colorOfBanner = widget.bannerColor ?? Colors.black.withOpacity(0.6);
    return Container(
      // width: widget.width,
      // height: widget.height,
      child: Stack(
        children: [
          ScaleTransition(
            scale: _scaleAnimation,
            child: Image.asset(
              widget.imageUrl,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
