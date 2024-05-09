import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/utils/text_styles.dart';

class TitleSection extends StatelessWidget {
  final String title;
  const TitleSection({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.textStyle20,
          ),
          Text(
            AppStrings.seeAll,
            style: TextStyles.textStyle14
                .copyWith(color: AppColors.secondaryColor),
          ),

          // const Icon(
          //   Icons.arrow_forward,
          //   color: AppColors.whiteColor,
          //   size: 20,
          // )
        ],
      ),
    );
  }
}
