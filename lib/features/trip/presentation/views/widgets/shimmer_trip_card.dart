import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../core/widgets/vertical_widget.dart';

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
            child: FadeShimmer(
              height: 72.h,
              width: 72.w,
              radius: 16.r,
            ),
          ),
          const HorizontalSpace(size: 12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HorizontalSpace(size: double.infinity),
                  FadeShimmer(
                    width: double.infinity,
                    height: 5.h,
                  ),
                  const VerticalSpace(size: 4),
                  FadeShimmer(
                    width: double.infinity,
                    height: 5.h,
                  ),
                  const VerticalSpace(size: 4),
                  FadeShimmer(
                    width: double.infinity,
                    height: 5.h,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
