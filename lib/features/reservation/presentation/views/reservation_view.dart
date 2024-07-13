import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../trip/presentation/manager/trip_cubit/trip_cubit.dart';
import '../manager/cubit/reservation_cubit.dart';
import 'widgets/reservation_form.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar('Reservation'),
        body: const ReservationForm(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 120.h,
            child: Column(
              children: [
                CustomButton(
                  text: S.of(context).save,
                  onPressed: () {
                    context.read<ReservationCubit>().saveReservation(
                          userId: context
                                  .read<CurrentAccountCubit>()
                                  .userInformations
                                  ?.userId ??
                              '',
                          choosenScheduleTripId:
                              context.read<TripCubit>().trip.tripId,
                        );
                  },
                ),
                VerticalSpace(size: 12.h),
                const CustomButton(
                  text: 'Process to Payment',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
