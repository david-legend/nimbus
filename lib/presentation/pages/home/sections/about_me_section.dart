import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/values/values.dart';

class AboutMeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth * 0.5;
    double contentAreaHeight = screenHeight * 0.9;

    return Container(
      child: Row(
        children: [
          ContentArea(
            width: contentAreaWidth,
            height: contentAreaHeight,
            child: Image.asset(
              ImagePath.DEV_ABOUT_ME,
            ),
          ),
          ContentArea(
            width: contentAreaWidth,
            height: contentAreaHeight,
            backgroundColor: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
