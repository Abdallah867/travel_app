import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/date_format_utils.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../data/models/trip_schedule_model.dart';
import '../../manager/cubit/reservation_cubit.dart';

class DateSelectWidget extends StatelessWidget {
  final bool isSelected;

  final TripScheduleModel tripSchedule;
  const DateSelectWidget({
    super.key,
    required this.tripSchedule,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<ReservationCubit>()
          .selectDate(tripSchedule.tripScheduleId),
      child: Container(
        width: 90.w,
        decoration: BoxDecoration(
            color: !isSelected ? AppColors.inputGrey : AppColors.secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormatUtils.getWeekday(tripSchedule.departureDate)
                  .substring(0, 3)
                  .toUpperCase(),
              style: TextStyles.textStyle14SemiBold.copyWith(
                color: !isSelected
                    ? Colors.black.withOpacity(.7)
                    : AppColors.whiteColor,
              ),
            ),
            VerticalSpace(size: 8.h),
            Text(
              DateFormatUtils.getFormattedDateByDayAndMonth(
                  tripSchedule.departureDate),
              style: TextStyles.textStyle20SemiBold.copyWith(
                color: !isSelected
                    ? Colors.black.withOpacity(.7)
                    : AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
