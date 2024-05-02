import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../core/widgets/horizontal_space.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 16,
          color: AppColors.yellowColor,
        ),
        const HorizontalSpace(size: 4),
        Text(
          '(5.0)',
          style: TextStyles.textStyle14.copyWith(
            color: AppColors.lighterGrey,
          ),
        ),
      ],
    );
  }
}
