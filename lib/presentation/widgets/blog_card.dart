import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

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
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: Sizes.MARGIN_16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Sizes.RADIUS_16)),
                  child: Image.asset(imageUrl),
                ),
                SpaceH8(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      dateIcon,
                      color: AppColors.primaryColor,
                    ),
                    SpaceW8(),
                    Text(
                      date,
                      style: dateStyle ?? textTheme.subtitle2,
                    )
                  ],
                ),
                SpaceH8(),
                Text(
                  title,
                  style: titleStyle ?? textTheme.headline5,
                ),
                SpaceH16(),
                NimbusButton(
                  buttonTitle: buttonText,
                  buttonColor: buttonColor,
                  onPressed: onPressed,
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
              category,
              style: categoryStyle ??
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
}
