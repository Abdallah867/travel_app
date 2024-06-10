import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../../core/widgets/custom_shimmer.dart';

class ShimmerTripCard extends StatelessWidget {
  const ShimmerTripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.whiteColor,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, bottom: 16.h, top: 16.h),
            child: const CustomShimmer.box(),
          ),
          const HorizontalSpace(size: 12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HorizontalSpace(size: double.infinity),
                  CustomShimmer(),
                  VerticalSpace(size: 8),
                  CustomShimmer(),
                  VerticalSpace(size: 8),
                  CustomShimmer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
