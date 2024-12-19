import '../../../../../core/services/service_locator.dart';
import '../../../data/models/reservation_model.dart';
import '../../../data/repos/reservation_repo_impl.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'reservation_card_bloc_builder.dart';

class ReservationCard extends StatelessWidget {
  final ReservationModel reservation;
  const ReservationCard({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReservationCubit(
        reservation: reservation,
        reservationRepo: getIt.get<ReservationRepoImpl>(),
      )
        ..setTravelers(reservation.travelers)
        ..getTripSchedule(reservation.tripSchedule.trip.tripId),
      child: const ReservationCardBlocBuilder(),
    );
  }
}
