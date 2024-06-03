import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/horizontal_space.dart';

import '../../../../trip/presentation/manager/trip_details_cubit/trip_cubit.dart';

class LocationAndPriceWidget extends StatelessWidget {
  const LocationAndPriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tripCubit = BlocProvider.of<TripCubit>(context);
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
              tripCubit.trip.location,
              style: TextStyles.textStyle14.copyWith(
                fontWeight: FontWeightHelper.medium,
                color: AppColors.lighterGrey,
              ),
            ),
          ],
        ),
        Text(
          tripCubit.trip.price.toString(),
          style: TextStyles.textStyle14.copyWith(
            fontWeight: FontWeightHelper.semiBold,
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}
