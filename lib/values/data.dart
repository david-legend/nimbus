part of values;

class Data {
  static List<SocialButtonData> socialData = [
    SocialButtonData(
      tag: StringConst.TWITTER_URL,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
    SocialButtonData(
      tag: StringConst.FACEBOOK_URL,
      iconData: FontAwesomeIcons.facebook,
      url: StringConst.FACEBOOK_URL,
    ),
    SocialButtonData(
      tag: StringConst.LINKED_IN_URL,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialButtonData(
      tag: StringConst.INSTAGRAM_URL,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.INSTAGRAM_URL,
    ),
  ];
  static List<SocialButton2Data> socialData2 = [
    SocialButton2Data(
      title: StringConst.BEHANCE,
      iconData: FontAwesomeIcons.behance,
      url: StringConst.TWITTER_URL,
      titleColor: AppColors.blue300,
      buttonColor: AppColors.blue300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: StringConst.DRIBBLE,
      iconData: FontAwesomeIcons.dribbble,
      url: StringConst.TWITTER_URL,
      titleColor: AppColors.pink300,
      buttonColor: AppColors.pink300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: StringConst.INSTA,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.TWITTER_URL,
      titleColor: AppColors.yellow300,
      buttonColor: AppColors.yellow300,
      iconColor: AppColors.white,
    ),
  ];

  static List<SkillLevelData> skillLevelData = [
    SkillLevelData(
      skill: StringConst.SKILLS_1,
      level: 80,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_2,
      level: 90,
    ),
    SkillLevelData(
      skill: StringConst.SKILLS_3,
      level: 70,
    ),
  ];

  static List<SkillCardData> skillCardData = [
    SkillCardData(
      title: StringConst.SKILLS_1,
      iconData: FontAwesomeIcons.compress,
    ),
    SkillCardData(title: "", iconData: Icons.pages_outlined), //not being used
    SkillCardData(
      title: StringConst.SKILLS_2,
      iconData: Icons.pages_outlined,
    ),
    SkillCardData(
      title: StringConst.SKILLS_3,
      iconData: FontAwesomeIcons.paintBrush,
    ),
    SkillCardData(
      title: StringConst.SKILLS_4,
      iconData: FontAwesomeIcons.recordVinyl,
    ),
    SkillCardData(title: "", iconData: Icons.pages_outlined), //not being used
  ];
  static List<StatItemData> statItemsData = [
    StatItemData(
        title: StringConst.HAPPY_CLIENTS_NUM,
        subtitle: StringConst.HAPPY_CLIENTS),
    StatItemData(
        title: StringConst.YEARS_OF_EXPERIENCE_NUM,
        subtitle: StringConst.YEARS_OF_EXPERIENCE),
    StatItemData(
        title: StringConst.INCREDIBLE_PROJECTS_NUM,
        subtitle: StringConst.INCREDIBLE_PROJECTS),
    StatItemData(
        title: StringConst.AWARD_WINNING_NUM,
        subtitle: StringConst.AWARD_WINNING),
  ];
}
