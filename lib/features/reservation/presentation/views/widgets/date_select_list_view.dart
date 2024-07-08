import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'date_select_widget.dart';

class DateSelectListView extends StatelessWidget {
  const DateSelectListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tripSchedule = context.read<ReservationCubit>().tripSchedule;

    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        return SizedBox(
          height: 130.h,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0.w),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) =>
                  DateSelectWidget(
                isSelected: tripSchedule[index].tripScheduleId ==
                    context.read<ReservationCubit>().selectedScheduleId,
                tripSchedule: tripSchedule[index],
              ),
              itemCount: tripSchedule.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const HorizontalSpace(size: 15),
            ),
          ),
        );
      },
    );
  }
}
