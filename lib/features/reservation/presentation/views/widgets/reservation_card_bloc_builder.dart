import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/date_format_utils.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_shimmer.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../../trip/data/repos/trip_repo_impl.dart';
import '../../../../trip/presentation/manager/trip_cubit/trip_cubit.dart';
import '../../../../trip/presentation/views/widgets/custom_image_box.dart';
import '../../../data/models/reservation_model.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'reservation_loading_card.dart';

class ReservationCardBlocBuilder extends StatelessWidget {
  const ReservationCardBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        final reservation = context.read<ReservationCubit>().reservation;

        return Container(
          decoration: BoxDecoration(
            // border radius
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(17, 17, 26, 0.1),
                blurRadius: 0,
                spreadRadius: 0,
                offset: Offset(
                  0,
                  1,
                ),
              ),
            ],
            color: AppColors.whiteColor,
          ),
          child: Column(
            children: [
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
                              style: TextStyles.textStyle14),
                          const VerticalSpace(size: 12),
                          Text('${reservation.travelers.length} Persons',
                              style: TextStyles.textStyle14SemiBold),

                          // const LocationAndPriceWidget(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        height: 40.h,
                        text: 'View Details',
                        style: TextStyles.textStyle14.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeightHelper.semiBold),
                        onPressed: () {
                          context.push(
                              '${AppRoutes.kBookingView}/${reservation.tripSchedule.trip.tripId}/edit',
                              extra: {
                                'reservationCubit':
                                    context.read<ReservationCubit>(),
                                'tripCubit': TripCubit(
                                  trip: reservation.tripSchedule.trip,
                                  tripRepo: getIt.get<TripRepoImpl>(),
                                ),
                                'currentAccountCubit':
                                    BlocProvider.of<CurrentAccountCubit>(
                                        context),
                              });
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
                              color: AppColors.inputGrey, width: 2),
                          height: 40.h,
                          text: 'Cancel Booking',
                          onPressed: () {
                            showCancelBookingDialog(context);
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

Future<dynamic> showCancelBookingDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Are you sure you want to cancel the trip ?',
            style: TextStyles.textStyle16SemiBold,
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: CustomButton(
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
                      context.pop();
                    },
                  ),
                ),
                const HorizontalSpace(size: 16),
                Expanded(
                  child: CustomButton(
                    text: 'Yes, Cancel Trip',
                    color: Colors.transparent,
                    style: TextStyles.textStyle14SemiBold.copyWith(
                      color: Colors.red,
                    ),
                    height: 40.h,
                  ),
                ),
              ],
            ),
          ],
        );
      });
}
