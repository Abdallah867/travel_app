// import '../../../../../core/functions/custom_app_bar.dart';
// import '../../../../../core/widgets/vertical_widget.dart';
// import '../../manager/cubit/reservation_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'reservation_card.dart';

// class BookingsListViewBody extends StatelessWidget {
//   const BookingsListViewBody({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ReservationCubit, ReservationState>(
//       builder: (context, state) {
//         final reservations = context.read<ReservationCubit>().reservations;
//         return Scaffold(
//           appBar: customAppBar('Bookings'),
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ListView.separated(
//               separatorBuilder: (context, index) => const VerticalSpace(
//                 size: 16.0,
//               ),
//               itemCount: reservations.length,
//               itemBuilder: (context, index) =>
//                   ReservationCard(reservation: reservations[index]),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/text_styles.dart';
import 'reservation_loading_card.dart';

import '../../../../../core/enums/reservation_status.dart';
import '../../../../../core/functions/custom_app_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bookings_status_chip_list.dart';
import 'reservation_card.dart';

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
          appBar: customAppBar('Bookings'),
          body: CustomScrollView(
            slivers: [
              // Chip List as a standalone widget
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                  child: BookingsStatusChipList(
                    chipLabels: const ['Upcoming', 'Previous', 'Cancelled'],
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
                      } else if (state is ReservationFailure) {
                        return Center(
                          child: Text(
                            'An Error Occured, Try Again',
                            style: TextStyles.textStyle16SemiBold,
                          ),
                        );
                      } else {
                        if (reservationCubit.reservations.isEmpty) {
                          return Center(
                            child: Text(
                              'No Bookings Found',
                              style: TextStyles.textStyle16SemiBold,
                            ),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: ReservationCard(
                                reservation:
                                    reservationCubit.reservations[index]),
                          );
                        }
                      }
                    },
                    childCount: state is ReservationLoadInProgress
                        ? 5
                        : reservationCubit.reservations.length,
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
