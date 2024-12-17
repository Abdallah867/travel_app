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

import '../../../../../core/enums/reservation_status.dart';
import '../../../../../core/functions/custom_app_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  child: HorizontalChipList(
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
                padding: const EdgeInsets.all(8.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: ReservationCard(
                            reservation: reservationCubit.reservations[index]),
                      );
                    },
                    childCount: reservationCubit.reservations.length,
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

class HorizontalChipList extends StatefulWidget {
  final List<String> chipLabels;
  final ValueChanged<int> onChipSelected;

  const HorizontalChipList({
    super.key,
    required this.chipLabels,
    required this.onChipSelected,
  });

  @override
  State<HorizontalChipList> createState() => _HorizontalChipListState();
}

class _HorizontalChipListState extends State<HorizontalChipList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.chipLabels.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.onChipSelected(index);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      isSelected ? AppColors.secondaryColor : Colors.grey[300],
                  borderRadius:
                      BorderRadius.circular(24.0), // Makes it circular
                  // boxShadow: [
                  //   if (isSelected)
                  //     const BoxShadow(
                  //       color: Colors.tealAccent,
                  //       blurRadius: 5,
                  //       offset: Offset(0, 3),
                  //     ),
                  // ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Center(
                  child: Text(
                    widget.chipLabels[index],
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
