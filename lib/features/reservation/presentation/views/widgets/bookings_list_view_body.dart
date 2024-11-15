import '../../../../../core/functions/custom_app_bar.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'reservation_card.dart';

class BookingsListViewBody extends StatelessWidget {
  const BookingsListViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        final reservations = context.read<ReservationCubit>().reservations;
        return Scaffold(
          appBar: customAppBar('Bookings'),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              separatorBuilder: (context, index) => const VerticalSpace(
                size: 16.0,
              ),
              itemCount: reservations.length,
              itemBuilder: (context, index) =>
                  ReservationCard(reservation: reservations[index]),
            ),
          ),
        );
      },
    );
  }
}
