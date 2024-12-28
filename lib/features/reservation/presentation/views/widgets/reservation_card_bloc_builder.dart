import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/date_format_utils.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../payment/data/models/payment_model.dart';
import '../../../../trip/presentation/views/widgets/custom_image_box.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'payment_status_chip.dart';
import 'reservation_card_buttons.dart';

class ReservationCardBlocBuilder extends StatelessWidget {
  const ReservationCardBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        final reservationCubit = context.read<ReservationCubit>();

        final reservation = reservationCubit.reservation;
        final String? payment = reservationCubit.reservation?.payment?.status;
        log('$payment');
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(17, 17, 26, 0.1),
                blurRadius: 0,
                spreadRadius: 0,
                offset: Offset(0, 1),
              ),
            ],
            color: AppColors.whiteColor,
          ),
          child: Column(
            children: [
              // Reservation Details Row
              Row(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 16.w,
                      top: 12.h,
                      bottom: 12.h,
                    ),
                    child: CustomImageBox(
                      imageUrl: reservation!.tripSchedule.trip.coverImage,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HorizontalSpace(size: double.infinity),
                          Text(
                            reservation.tripSchedule.trip.title,
                            style: TextStyles.textStyle16SemiBold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const VerticalSpace(size: 4),
                          Text(
                            DateFormatUtils.formatDate(
                              reservation.tripSchedule.departureDate,
                            ),
                            style: TextStyles.textStyle14,
                          ),
                          // const VerticalSpace(size: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${reservation.travelers.length} ${S.of(context).persons}',
                                style: TextStyles.textStyle14SemiBold,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.only(end: 4.w),
                                child: PaymentStatusChip(
                                  isPaid: reservation.payment?.status == null
                                      ? false
                                      : reservation.payment!.status == 'paid'
                                          ? true
                                          : false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              // Action Buttons and Payment Status
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 8.h),
                child: ReservationCardButtons(
                  status: reservationCubit.statusFilter,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
