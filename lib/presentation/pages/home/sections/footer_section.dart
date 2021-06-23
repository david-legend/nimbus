import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/buttons/nimbus_button.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

//TODO:: Add proper background to footerCard
//TODO:: Add proper icons for footerItems
//TODO:: Add proper backgrounds to button
//TODO:: Add proper textSizes, fontStyles, fontFamilies etc.
//Sacramento font for footer
List<FooterItem> footerItems = [
  FooterItem(
    title: StringConst.PHONE_ME + ":",
    subtitle: StringConst.PHONE_NUMBER,
    iconData: FontAwesomeIcons.phoneAlt,
  ),
  FooterItem(
    title: StringConst.MAIL_ME + ":",
    subtitle: StringConst.DEV_EMAIL_2,
    iconData: FontAwesomeIcons.solidEnvelope,
  ),
  FooterItem(
    title: StringConst.FOLLOW_ME_2 + ":",
    subtitle: StringConst.BEHANCE_ID,
    iconData: FontAwesomeIcons.behanceSquare,
  ),
];

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? footerTextStyle = textTheme.bodyText2?.copyWith(
      color: AppColors.primaryText1,
      fontWeight: FontWeight.bold,
    );
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = screenWidth * 1.0;
    double contentAreaHeight = screenHeight * 1.0;
    double spacerHeight = screenHeight * 0.15;
    return ContentArea(
      width: contentAreaWidth,
      height: contentAreaHeight,
      child: Column(
        children: [
          SizedBox(height: spacerHeight),
          ContentArea(
            width: contentAreaWidth * 0.8,
            height: contentAreaHeight * 0.7,
            backgroundColor: AppColors.black,
            borderRadius: const BorderRadius.all(
              Radius.circular(Sizes.RADIUS_8),
            ),
            child: Column(
              children: [
                Spacer(flex: 2),
                Text(
                  StringConst.LETS_TALK,
                  style: textTheme.headline3?.copyWith(color: AppColors.white),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 3),
                    ..._buildFooterItems(footerItems),
                    Spacer(flex: 3),
                  ],
                ),
                Spacer(),
                NimbusButton(
                  buttonTitle: StringConst.HIRE_ME,
                  buttonColor: AppColors.primaryColor,
                  onPressed: () {},
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
          SpaceH20(),
          SelectableText.rich(
            TextSpan(
              text: StringConst.RIGHTS_RESERVED + " ",
              style: footerTextStyle,
              children: [
                TextSpan(text: StringConst.DESIGNED_BY + " "),
                TextSpan(
                  text: StringConst.WEB_GENIUS_LAB,
                  style: footerTextStyle?.copyWith(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          SpaceH4(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: StringConst.BUILT_BY + " ",
                  style: footerTextStyle,
                  children: [
                    TextSpan(
                      text: StringConst.DAVID_COBBINA + ". ",
                      style: footerTextStyle?.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SpaceH4(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(StringConst.MADE_IN_GHANA, style: footerTextStyle),
              SpaceW4(),
              ClipRRect(
                borderRadius: BorderRadius.all(const Radius.circular(20)),
                child: Image.asset(
                  ImagePath.GHANA_FLAG,
                  width: Sizes.WIDTH_16,
                  height: Sizes.HEIGHT_16,
                  fit: BoxFit.cover,
                ),
              ),
              SpaceW4(),
              Text(StringConst.WITH_LOVE, style: footerTextStyle),
              SpaceW4(),
              Icon(
                FontAwesomeIcons.solidHeart,
                color: AppColors.red,
                size: Sizes.ICON_SIZE_12,
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFooterItems(List<FooterItem> data) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        FooterItem(
          title: data[index].title,
          subtitle: data[index].subtitle,
          iconData: data[index].iconData,
        ),
      );
      if (index < data.length - 1) {
        items.add(Spacer());
      }
    }
    return items;
  }
}

class FooterItem extends StatelessWidget {
  FooterItem({
    required this.iconData,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Icon(
          iconData,
          color: AppColors.primaryColor,
          size: Sizes.ICON_SIZE_36,
        ),
        SpaceH8(),
        Text(
          title,
          style: textTheme.subtitle1?.copyWith(
            color: AppColors.white,
          ),
        ),
        SpaceH8(),
        Text(
          subtitle,
          style: textTheme.bodyText1?.copyWith(
            color: AppColors.primaryText1,
          ),
        ),
      ],
    );
  }
}
