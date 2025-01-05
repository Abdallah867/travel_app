import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/reservation_model.dart';
import '../../manager/cubit/reservation_cubit.dart';

class CancelBookingButton extends StatelessWidget {
  final ReservationModel reservation;
  const CancelBookingButton({
    super.key,
    required this.reservation,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomButton(
        onPressed: () =>
            showCancelBookingDialog(context, context.read<ReservationCubit>()),
        color: AppColors.whiteColor,
        style: TextStyles.textStyle14.copyWith(
          color: Colors.black.withOpacity(.35),
          fontWeight: FontWeightHelper.semiBold,
        ),
        borderSide: const BorderSide(
          color: AppColors.inputGrey,
          width: 2,
        ),
        height: 40.h,
        text: S.of(context).cancelBooking,
      ),
    );
  }

  Future<dynamic> showCancelBookingDialog(
    BuildContext context,
    reservationCubit,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: reservationCubit as ReservationCubit,
          child: Builder(builder: (context) {
            return AlertDialog(
              backgroundColor: AppColors.whiteColor,
              content: Text(
                'Are you sure you want to cancel the trip?',
                style: TextStyles.textStyle16SemiBold,
                textAlign: TextAlign.center,
              ),
              actions: [
                Column(
                  children: [
                    CustomButton(
                      onPressed: () async {
                        await context
                            .read<ReservationCubit>()
                            .cancelReservation(reservation.reservationId);
                        context.pop();
                      },
                      text: 'Yes, Cancel Trip',
                      color: Colors.transparent,
                      style: TextStyles.textStyle14SemiBold.copyWith(
                        color: Colors.red,
                      ),
                      height: 40.h,
                    ),
                    const HorizontalSpace(size: 8),
                    CustomButton(
                      color: Colors.transparent,
                      borderSide: const BorderSide(
                        color: AppColors.inputGrey,
                        width: 2,
                      ),
                      text: 'No, I change my mind',
                      style: TextStyles.textStyle14SemiBold.copyWith(
                        color: Colors.black.withOpacity(.5),
                      ),
                      height: 40.h,
                      onPressed: () {
                        context.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            );
          }),
        );
      },
    );
  }
}
