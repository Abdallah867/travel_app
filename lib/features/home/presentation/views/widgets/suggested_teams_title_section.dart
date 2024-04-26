import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';

class SuggestedTeamsTitleSection extends StatelessWidget {
  const SuggestedTeamsTitleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Suggested Teams',
            style: TextStyles.textStyle20,
          ),
          const Icon(
            Icons.arrow_forward,
            color: AppColors.whiteColor,
            size: 20,
          )
        ],
      ),
    );
  }
}
