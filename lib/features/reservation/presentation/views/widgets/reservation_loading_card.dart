import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_shimmer.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationLoadingCard extends StatelessWidget {
  const ReservationLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(17, 17, 26, 0.1),
            blurRadius: 0,
            spreadRadius: 0,
            offset: Offset(0, 1),
          ),
        ],
        color: AppColors.whiteColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 16.w,
                  top: 12.h,
                  bottom: 12.h,
                ),
                child: const CustomShimmer.box(
                  height: 72,
                  width: 72,
                  radius: 16,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomShimmer(
                        height: 16,
                        width: double.infinity,
                      ),
                      VerticalSpace(size: 4),
                      CustomShimmer(
                        height: 14,
                        width: 120,
                      ),
                      VerticalSpace(size: 12),
                      CustomShimmer(
                        height: 14,
                        width: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const VerticalSpace(size: 12),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 8.h),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomShimmer(
                    height: 40,
                    width: double.infinity,
                    radius: 24,
                  ),
                ),
                HorizontalSpace(size: 16),
                Expanded(
                  child: CustomShimmer(
                    height: 40,
                    width: double.infinity,
                    radius: 24,
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpace(size: 8),
        ],
      ),
    );
  }
}
