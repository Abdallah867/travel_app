import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/horizontal_space.dart';

class ReviewWidget extends StatelessWidget {
  final double review;
  const ReviewWidget({
    super.key,
    this.review = 5.0,
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
          '(${review.toDouble().toStringAsFixed(1)})',
          style: TextStyles.textStyle14.copyWith(
            color: AppColors.lighterGrey,
          ),
        ),
      ],
    );
  }
}
