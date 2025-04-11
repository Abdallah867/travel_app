import '../../../../../core/enums/payment_status.dart';
import '../../../../../core/enums/reservation_status.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'reservation_cancelled_buttons.dart';
import 'reservation_previous_buttons.dart';
import 'reservation_upcoming_buttons.dart';

class ReservationCardButtons extends StatelessWidget {
  final ReservationStatus reservationStatus;
  final PaymentStatus paymentStatus;
  const ReservationCardButtons({
    super.key,
    required this.reservationStatus,
    required this.paymentStatus,
  });

  @override
  Widget build(BuildContext context) {
    final reservation = context.read<ReservationCubit>().reservation!;
    switch (reservationStatus) {
      case ReservationStatus.upcoming:
        return ReservationUpcomingButtons(
          reservation: reservation,
          paymentStatus: paymentStatus,
        );
      case ReservationStatus.previous:
        return ReservationPreviousButtons(
          reservation: reservation,
          paymentStatus: paymentStatus,
        );
      case ReservationStatus.cancelled:
        return ReservationCancelledButtons(
          reservation: reservation,
          paymentStatus: paymentStatus,
        );
    }
  }
}
