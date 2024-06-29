import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../generated/l10n.dart';

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
          Text(title, style: TextStyles.textStyle20),
          Text(
            S.of(context).seeAll,
            style: TextStyles.textStyle14
                .copyWith(color: AppColors.secondaryColor),
          ),
        ],
      ),
    );
  }
}
