import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

class SocialButton2Data {
  final String title;
  final String url;
  final IconData iconData;
  final Color? iconColor;
  final Color? buttonColor;
  final Color? titleColor;

  SocialButton2Data({
    required this.title,
    required this.iconData,
    required this.url,
    this.iconColor,
    this.buttonColor,
    this.titleColor,
  });
}

class SocialButton2 extends StatefulWidget {
  SocialButton2({
    required this.title,
    required this.iconData,
    required this.onPressed,
    this.titleStyle,
    this.titleColor = AppColors.black,
    this.buttonWidth = Sizes.WIDTH_40,
    this.buttonHeight = Sizes.HEIGHT_40,
    this.width,
    this.height,
    this.elevation = Sizes.ELEVATION_1,
    this.buttonColor = AppColors.white,
    this.hoverButtonColor = AppColors.grey70,
    this.hoverTextColor = AppColors.black400,
    this.iconColor = AppColors.black,
    this.iconSize = Sizes.ICON_SIZE_20,
    this.hasTitle = true,
  });

  final String title;
  final Color? titleColor;
  final TextStyle? titleStyle;
  final bool hasTitle;
  final double buttonWidth;
  final double buttonHeight;
  final double? width;
  final double? height;
  final double elevation;
  final IconData iconData;
  final double iconSize;
  final Color? iconColor;
  final Color? buttonColor;
  final Color hoverButtonColor;
  final Color? hoverTextColor;
  final VoidCallback? onPressed;

  @override
  _SocialButton2State createState() => _SocialButton2State();
}

class _SocialButton2State extends State<SocialButton2>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController controller;
  late Animation<Color?> animation;
  late Color? startColor;
  late Color? targetColor;

  @override
  void initState() {
    super.initState();
    startColor = widget.titleColor;
    targetColor = widget.hoverTextColor;

    controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    animation = ColorTween(
      begin: startColor,
      end: targetColor,
    ).animate(controller);
  }

@override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              width: widget.buttonWidth,
              height: widget.buttonHeight,
              duration: Duration(milliseconds: 400),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                  color: _isHovering
                      ? widget.hoverButtonColor
                      : widget.buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: MaterialButton(
                onPressed: widget.onPressed,
                child: Icon(
                  widget.iconData,
                  size: widget.iconSize,
                  color: _isHovering ? widget.buttonColor : widget.iconColor,
                ),
              ),
            ),
            SpaceW12(),
            Text(
              widget.title,
              style: widget.titleStyle ??
                  textTheme.subtitle2?.copyWith(
                    fontSize: Sizes.TEXT_SIZE_13,
                    color:  animation.value,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    if (hovering) {
      setState(() {
        controller.forward();
        _isHovering = hovering;
      });
    } else {
      setState(() {
        startColor = widget.hoverTextColor;
        targetColor = widget.titleColor;
        _isHovering = hovering;
        controller.reset();
        controller.forward();
      });
    }
  }
}
