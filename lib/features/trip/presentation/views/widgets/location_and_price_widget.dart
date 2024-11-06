import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/trip_cubit/trip_cubit.dart';
import 'location_widget.dart';

class LocationAndPriceWidget extends StatelessWidget {
  const LocationAndPriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final trip = BlocProvider.of<TripCubit>(context).trip;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LocationWidget(location: trip.location),
        Text(
          '${trip.price} ${S.of(context).algerianCurrency}',
          style: TextStyles.textStyle14.copyWith(
            fontWeight: FontWeightHelper.semiBold,
            color: AppColors.secondaryColor,
          ),
        ),
      ],
    );
  }
}
