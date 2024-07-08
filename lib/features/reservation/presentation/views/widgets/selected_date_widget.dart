import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/vertical_widget.dart';

class SelectedDateWidget extends StatelessWidget {
  const SelectedDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 10),
      height: 82.h,
      width: 92.w,
      decoration: const BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sat",
            style: TextStyles.textStyle14SemiBold.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
          VerticalSpace(size: 8.h),
          Text("25/6",
              style: TextStyles.textStyle20SemiBold.copyWith(
                color: AppColors.whiteColor,
              )),
          VerticalSpace(size: 8.h),
          Text(
            "30 seats",
            style: TextStyles.textStyle14SemiBold.copyWith(
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
