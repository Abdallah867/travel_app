import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/enums/reservation_status.dart';
import '../../../../../core/functions/custom_app_bar.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'bookings_status_chip_list.dart';
import 'reservation_card.dart';
import 'reservation_loading_card.dart';

class BookingsListViewBody extends StatefulWidget {
  const BookingsListViewBody({
    super.key,
  });

  @override
  State<BookingsListViewBody> createState() => _BookingsListViewBodyState();
}

class _BookingsListViewBodyState extends State<BookingsListViewBody> {
  int currentChipIndex =
      0; // Tracks the selected chip (e.g., Upcoming, Previous)

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        final reservationCubit = context.read<ReservationCubit>();
        return Scaffold(
          appBar: customAppBar(S.of(context).bookings),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                  child: BookingsStatusChipList(
                    chipLabels: [
                      S.of(context).upcoming,
                      S.of(context).previous,
                      S.of(context).cancelled,
                    ],
                    onChipSelected: (index) async {
                      await reservationCubit.getReservations(
                        userId: context
                            .read<CurrentAccountCubit>()
                            .userInformations!
                            .userId,
                        statusFilter: getReservationStatusFromIndex(index),
                      );
                      // setState(() {
                      //   currentChipIndex = index;
                      // });
                    },
                  ),
                ),
              ),
              // Reservations List

              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (state is ReservationLoadInProgress) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: const ReservationLoadingCard(),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: ReservationCard(
                            reservation: reservationCubit.reservations[index],
                          ),
                        );
                      }
                    },
                    childCount: state is ReservationLoadInProgress
                        ? 5
                        : reservationCubit.reservations.length,
                  ),
                ),
              ),
              if (reservationCubit.reservations.isEmpty)
                SliverFillRemaining(
                  child: Center(
                    child: Text(
                      S.of(context).noBookings,
                      style: TextStyles.textStyle14,
                    ),
                  ),
                ),

              if (state is ReservationFailure)
                SliverFillRemaining(
                  child: Center(
                    child: Text(
                      S.of(context).error,
                      style: TextStyles.textStyle14,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
