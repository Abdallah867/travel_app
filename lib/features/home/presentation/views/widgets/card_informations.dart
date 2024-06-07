import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../trip/presentation/manager/trip_cubit/trip_cubit.dart';
import '../../../../trip/presentation/views/widgets/location_and_price_widget.dart';

class CardInformations extends StatelessWidget {
  const CardInformations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const VerticalSpace(size: 4),
          Text(
            BlocProvider.of<TripCubit>(context).trip.title,
            style: TextStyles.textStyle16
                .copyWith(fontWeight: FontWeightHelper.semiBold),
          ),
          const VerticalSpace(size: 4),
          const LocationAndPriceWidget(),
        ],
      ),
    );
  }
}
