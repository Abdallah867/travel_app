import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Agences de voyage',
            style: TextStyles.textStyle20,
          ),
          Text(
            'Voir tous',
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
