import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../manager/trip_cubit/trip_cubit.dart';

class AgencyEmailWidget extends StatelessWidget {
  const AgencyEmailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        context.read<TripCubit>().trip.agency!.email,
        style: TextStyles.textStyle14.copyWith(
          fontWeight: FontWeightHelper.medium,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
