import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

//TODO:: Add AppDrawer
class NavSectionMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavSectionMobile({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.HEIGHT_100,
      decoration: BoxDecoration(
        color: AppColors.black100,
      ),
      child: Row(
        children: [
          SpaceW30(),
          IconButton(
            icon: Icon(
              FeatherIcons.menu,
              color: AppColors.white,
              size: Sizes.ICON_SIZE_26,
            ),
            onPressed: () {},
          ),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Image.asset(
              ImagePath.LOGO_LIGHT,
              height: Sizes.HEIGHT_52,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
