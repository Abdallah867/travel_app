import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/horizontal_space.dart';

class LocationWidget extends StatelessWidget {
  final String location;
  const LocationWidget({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          color: AppColors.lightGrey,
          size: 16,
        ),
        const HorizontalSpace(size: 2),
        Text(
          location,
          style: TextStyles.textStyle14.copyWith(
            fontWeight: FontWeightHelper.medium,
            color: AppColors.lightGrey,
          ),
        ),
      ],
    );
  }
}
