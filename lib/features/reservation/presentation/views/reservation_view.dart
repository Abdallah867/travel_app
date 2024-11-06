import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/horizontal_space.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../trip/presentation/manager/trip_cubit/trip_cubit.dart';
import '../manager/cubit/reservation_cubit.dart';
import 'widgets/reservation_bloc_consumer.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar('Reservation'),
        body: const ReservationBlocConsumer(),
        bottomNavigationBar: const PaymentAndSaveButtons(),
      ),
    );
  }
}

class PaymentAndSaveButtons extends StatelessWidget {
  const PaymentAndSaveButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reservationCubit = context.read<ReservationCubit>();
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              state is ReservationSaveInProgress
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 36.w),
                      child: const CircularProgressIndicator(),
                    )
                  : Expanded(
                      flex: 3,
                      child: CustomButton(
                        color: AppColors.backgroundColor,
                        textColor: AppColors.secondaryColor,
                        borderSide: const BorderSide(
                            color: AppColors.secondaryColor, width: 2),
                        text: reservationCubit.reservation != null
                            ? S.of(context).update
                            : S.of(context).save,
                        onPressed: () {
                          reservationCubit.reservation == null
                              ? reservationCubit.saveReservation(
                                  userId: context
                                      .read<CurrentAccountCubit>()
                                      .userInformations!
                                      .userId,
                                  choosenScheduleTripId:
                                      context.read<TripCubit>().trip.tripId,
                                )
                              : reservationCubit.updateReservation();
                        },
                      ),
                    ),
              const HorizontalSpace(size: 8),
              Expanded(
                flex: 4,
                child: CustomButton(
                  text: 'Proceed to Payment',
                  onPressed: () {
                    context.push(
                      AppRoutes.kPaymentView,
                      extra: context
                          .read<ReservationCubit>()
                          .reservation!
                          .tripSchedule
                          .trip,
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
