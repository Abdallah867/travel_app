import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  const CustomShimmer({
    super.key,
    this.height = 8,
    this.width = double.infinity,
    this.radius = 32,
  });

  const CustomShimmer.box({
    super.key,
    this.height = 72,
    this.width = 72,
    this.radius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return FadeShimmer(
      width: width.w,
      height: height.h,
      fadeTheme: FadeTheme.light,
      radius: radius.r,
    );
  }
}
