//import 'dart:math';
//
//import 'package:flutter/material.dart';
//import 'package:nimbus/presentation/widgets/selected_indicator.dart';
//import 'package:nimbus/values/values.dart';
//
//class AnimatedIndicator extends StatefulWidget {
//  AnimatedIndicator({
//    Key? key,
//    this.startWidth = 0.0,
//    required this.width,
//    required this.controller,
//    this.height = Sizes.SIZE_6,
//    this.indicatorColor = AppColors.primaryColor,
//  })  : width = IntTween(
//          begin: 0,
//          end: 60,
//        ).animate(
//          CurvedAnimation(
//            parent: controller,
//            curve: Interval(
//              0,
//              1,
//              curve: Curves.easeIn,
//            ),
//          ),
//        ),
//        super(key: key);
//
//  final Animation<double> controller;
//  final Animation<double> width;
//
////  final Animation<Color> color;
//  final Color indicatorColor;
//  final double startWidth;
//
////  final int width;
//  final double height;
//
////  final double opacity;
//
//  @override
//  _AnimatedIndicatorState createState() => _AnimatedIndicatorState();
//}
//
//class _AnimatedIndicatorState extends State<AnimatedIndicator> {
//  bool isAnimating = false;
//
//  @override
//  void initState() {
//    widget.controller.addStatusListener((status) {
//      if (status == AnimationStatus.forward) {
//        WidgetsBinding.instance!.addPostFrameCallback((_) {
//          setState(() {
//            isAnimating = true;
//          });
//        });
//      }
//      if (status == AnimationStatus.completed) {
//        WidgetsBinding.instance!.addPostFrameCallback((_) {
//          setState(() {
//            isAnimating = false;
//          });
//        });
//      }
//    });
//
//    super.initState();
//  }
//
//  Widget _buildAnimation(BuildContext context, Widget child) {
//    ThemeData theme = Theme.of(context);
//    return Container(
//      width: isAnimating ? widget.width : 0,
//      height: height,
//      color: indicatorColor,
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return AnimatedBuilder(
//      builder: _buildAnimation,
//      animation: widget.controller,
//    );
//  }
//}
