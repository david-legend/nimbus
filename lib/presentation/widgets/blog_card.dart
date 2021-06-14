import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';

class BlogCard extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Stack(
          children: [
            Image.asset(imageUrl),
            Text(category, style: categoryStyle),
          ],
        ),
        Row(
          children: [
            Icon(dateIcon),
            Text(
              date,
              style: dateStyle,
            )
          ],
        ),
        Text(
          title,
          style: titleStyle,
        ),
      ],
    );
  }
}
