import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

enum DisplayType {
  desktop,
  mobile,
}

const _desktopPortraitBreakpoint = 700.0;
const _desktopLandscapeBreakpoint = 1000.0;
const _ipadProBreakpoint = 1000.0;

/// Returns the [DisplayType] for the current screen. This app only supports
/// mobile and desktop layouts, and as such we only have one breakpoint.
DisplayType displayTypeOf(BuildContext context) {
  final orientation = MediaQuery.of(context).orientation;
  final width = MediaQuery.of(context).size.width;

  if ((orientation == Orientation.landscape &&
          width > _desktopLandscapeBreakpoint) ||
      (orientation == Orientation.portrait &&
          width > _desktopPortraitBreakpoint)) {
    return DisplayType.desktop;
  } else {
    return DisplayType.mobile;
  }
}

/// Returns a boolean if we are in a display of [DisplayType.desktop]. Used to
/// build adaptive and responsive layouts.
bool isDisplayDesktop(BuildContext context) {
  return displayTypeOf(context) == DisplayType.desktop;
}

/// Returns a boolean if we are in a display of [DisplayType.desktop] but less
/// than [_desktopLandscapeBreakpoint] width. Used to build adaptive and responsive layouts.
bool isDisplaySmallDesktop(BuildContext context) {
  return isDisplayDesktop(context) &&
      MediaQuery.of(context).size.width < _desktopLandscapeBreakpoint;
}

bool isDisplaySmallDesktopOrIpadPro(BuildContext context) {
  return isDisplaySmallDesktop(context) ||
      (MediaQuery.of(context).size.width > _ipadProBreakpoint &&
          MediaQuery.of(context).size.width < 1170);
}

double widthOfScreen(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double heightOfScreen(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double assignHeight(
  BuildContext context,
  double fraction, {
  double additions = 0.0,
  double subs = 0.0,
}) {
  return (heightOfScreen(context) - (subs) + (additions)) * fraction;
}

double assignWidth(
  BuildContext context,
  double fraction, {
  double additions = 0,
  double subs = 0,
}) {
  return (widthOfScreen(context) - (subs) + (additions)) * fraction;
}

double responsiveSize(
  BuildContext context,
  double xs,
  double lg, {
  double? sm,
  double? md,
  double? xl,
}) {
  return context.layout.value(
    xs: xs,
    sm: sm ?? xs,
    md: md ?? xs,
    lg: lg,
    xl: xl ?? lg,
  );
}

int responsiveSizeInt(
  BuildContext context,
  int xs,
  int lg, {
  int? sm,
  int? md,
  int? xl,
}) {
  return context.layout.value(
    xs: xs,
    sm: sm ?? xs,
    md: md ?? xs,
    lg: lg,
    xl: xl ?? lg,
  );
}

double getSidePadding(BuildContext context) {
  return assignWidth(context, 0.05);
}
