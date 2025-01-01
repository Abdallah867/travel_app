import '../../../../../core/enums/payment_status.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../../trip/data/repos/trip_repo_impl.dart';
import '../../../../trip/presentation/manager/trip_cubit/trip_cubit.dart';
import '../../../data/models/reservation_model.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'show_cancel_booking_dialog.dart';

class ReservationPreviousButtons extends StatelessWidget {
  const ReservationPreviousButtons({
    super.key,
    required this.reservation,
    required this.paymentStatus,
  });

  final ReservationModel reservation;
  final PaymentStatus paymentStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomButton(
            height: 40.h,
            text: S.of(context).viewDetails,
            style: TextStyles.textStyle14.copyWith(
              color: Colors.white,
              fontWeight: FontWeightHelper.semiBold,
            ),
            onPressed: () {
              context.push(
                '${AppRoutes.kBookingView}/${reservation.tripSchedule.trip.tripId}/edit',
                extra: {
                  'reservationCubit': context.read<ReservationCubit>(),
                  'tripCubit': TripCubit(
                    trip: reservation.tripSchedule.trip,
                    tripRepo: getIt.get<TripRepoImpl>(),
                  ),
                  'currentAccountCubit':
                      BlocProvider.of<CurrentAccountCubit>(context),
                },
              );
            },
          ),
        ),
        const HorizontalSpace(size: 16),
        Expanded(
          child: CustomButton(
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
            onPressed: () {
              showCancelBookingDialog(context);
            },
          ),
        ),
      ],
    );
  }
}
