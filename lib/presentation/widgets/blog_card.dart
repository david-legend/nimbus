import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

import 'animated_line_through.dart';
import 'buttons/animated_nimbus_button.dart';

class BlogCardData {
  final String category;
  final String date;
  final String title;
  final String buttonText;
  final String imageUrl;

  BlogCardData({
    required this.category,
    required this.title,
    required this.date,
    required this.buttonText,
    required this.imageUrl,
  });
}

class BlogCard extends StatefulWidget {
  BlogCard({
    required this.category,
    required this.title,
    required this.date,
    required this.buttonText,
    required this.imageUrl,
    this.dateStyle,
    this.titleStyle,
    this.categoryStyle,
    this.buttonTextStyle,
    this.width,
    this.height,
    this.buttonColor = AppColors.primaryColor,
    this.buttonIcon = Icons.chevron_right,
    this.dateIcon = Icons.date_range,
    this.onPressed,
  });

  final String category;
  final String date;
  final String title;
  final String buttonText;
  final String imageUrl;
  final double? width;
  final double? height;
  final TextStyle? dateStyle;
  final TextStyle? titleStyle;
  final TextStyle? categoryStyle;
  final TextStyle? buttonTextStyle;
  final IconData dateIcon;
  final IconData buttonIcon;
  final Color buttonColor;
  final VoidCallback? onPressed;

  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  bool _isHoveringOnImage = false;

  Color startValue = Colors.black.withOpacity(0.5);
  Color targetValue = Colors.black.withOpacity(0);

//  late Color targetValue;
//  late Color startValue;

  @override
  void initState() {
//    targetValue = lightOpacity;
//    startValue = dimOpacity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: Sizes.MARGIN_16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                MouseRegion(
                  onEnter: (e) => _onImageHover(true),
                  onExit: (e) => _onImageHover(false),
                  child: AnimatedOpacity(
                    opacity: _isHoveringOnImage ? 1.0 : 0.85,
                    duration: Duration(milliseconds: 300),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(Sizes.RADIUS_16),
                      ),
                      child: Image.asset(widget.imageUrl),
                    ),
                  ),
                ),
                SpaceH8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      widget.dateIcon,
                      color: AppColors.primaryColor,
                    ),
                    SpaceW8(),
                    Text(
                      widget.date,
                      style: widget.dateStyle ?? textTheme.subtitle2,
                    )
                  ],
                ),
                SpaceH8(),
                AnimatedLineThrough(
                  text: widget.title,
                  textStyle: widget.titleStyle ?? textTheme.headline5,
                ),
//                Text(
//                  widget.title,
//                  style: widget.titleStyle ?? textTheme.headline5,
//                ),
                SpaceH16(),
                AnimatedNimbusButton(
                  title: widget.buttonText,
                  iconData: Icons.arrow_forward_ios,
                  leadingButtonColor: widget.buttonColor,
                  onTap: widget.onPressed,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: Sizes.MARGIN_30),
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.PADDING_8, vertical: Sizes.PADDING_8),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Text(
              widget.category,
              style: widget.categoryStyle ??
                  textTheme.subtitle1?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_15,
                    color: AppColors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void _onImageHover(bool hovering) {
    setState(() {
      _isHoveringOnImage = hovering;
    });
  }
}
