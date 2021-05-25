part of 'values.dart';

class AppRadius {
  static const BorderRadius primaryRadius = const BorderRadius.only(
    topLeft: const Radius.circular(Sizes.RADIUS_30),
    topRight: const Radius.circular(Sizes.RADIUS_30),
  );

  static const BorderRadius defaultButtonRadius = const BorderRadius.only(
    topLeft: const Radius.circular(Sizes.RADIUS_30),
    bottomLeft: const Radius.circular(Sizes.RADIUS_30),
  );

  static const BorderRadius northTearDropRadius = const BorderRadius.only(
    topLeft: const Radius.circular(Sizes.RADIUS_80),
    bottomLeft: const Radius.circular(Sizes.RADIUS_80),
    bottomRight: const Radius.circular(Sizes.RADIUS_80),
  );
  static const BorderRadius southTearDropRadius = const BorderRadius.only(
    topRight: const Radius.circular(Sizes.RADIUS_80),
    topLeft: const Radius.circular(Sizes.RADIUS_80),
    bottomRight: const Radius.circular(Sizes.RADIUS_80),
  );

  static const BorderRadius southSemiCircleRadius = const BorderRadius.only(
    bottomRight: const Radius.circular(Sizes.RADIUS_80),
    bottomLeft: const Radius.circular(Sizes.RADIUS_80),
  );

  static const BorderRadius northSemiCircleRadius = const BorderRadius.only(
    topLeft: const Radius.circular(Sizes.RADIUS_80),
    topRight: const Radius.circular(Sizes.RADIUS_80),
  );

  static const BorderRadius westSemiCircleRadius = const BorderRadius.only(
    topLeft: const Radius.circular(Sizes.RADIUS_80),
    bottomLeft: const Radius.circular(Sizes.RADIUS_80),
  );

  static const BorderRadius eastSemiCircleRadius = const BorderRadius.only(
    topRight: const Radius.circular(Sizes.RADIUS_80),
    bottomRight: const Radius.circular(Sizes.RADIUS_80),
  );

  static const BorderRadius fullCircleRadius = const BorderRadius.all(
    const Radius.circular(Sizes.RADIUS_80),
  );

  static const BorderRadius noRadius = const BorderRadius.all(
    const Radius.circular(Sizes.RADIUS_0),
  );

  static const BorderRadius aboutRadius = const BorderRadius.all(
    const Radius.circular(Sizes.RADIUS_8),
  );
}
