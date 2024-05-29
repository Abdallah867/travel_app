import 'package:flutter/material.dart';
import 'package:travel_app/core/utils/app_colors.dart';
import 'package:travel_app/core/utils/font_weight_helper.dart';
import 'package:travel_app/core/utils/text_styles.dart';
import 'package:travel_app/core/widgets/horizontal_space.dart';

class LocationAndPriceWidget extends StatelessWidget {
  const LocationAndPriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: AppColors.lighterGrey,
              size: 16,
            ),
            const HorizontalSpace(size: 2),
            Text(
              'Skikda',
              style: TextStyles.textStyle14.copyWith(
                fontWeight: FontWeightHelper.medium,
                color: AppColors.lighterGrey,
              ),
            ),
          ],
        ),
        Text(
          '20.000 DZD',
          style: TextStyles.textStyle14.copyWith(
            fontWeight: FontWeightHelper.semiBold,
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}
