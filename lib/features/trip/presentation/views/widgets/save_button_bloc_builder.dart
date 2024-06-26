import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../manager/trip_cubit/trip_cubit.dart';
import 'custom_circular_icon.dart';

class SaveButtonBlocBuilder extends StatelessWidget {
  const SaveButtonBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userId =
        BlocProvider.of<CurrentAccountCubit>(context).userInformations?.userId;

    final tripCubit = BlocProvider.of<TripCubit>(context);

    final tripId = tripCubit.trip.tripId;

    return BlocBuilder<TripCubit, TripState>(builder: (context, state) {
      return AbsorbPointer(
        absorbing:
            TripCubit is TripLoadInProgress || tripCubit.savedTripsIds == null
                ? true
                : false,
        child: CustomCircularIcon(
          icon: tripCubit.isTripSaved ? Icons.bookmark : Icons.bookmark_outline,
          onPressed: () {
            if (tripCubit.isTripSaved) {
              tripCubit.unsaveTrip(
                tripId: tripId,
                userId: userId!,
              );
            } else {
              tripCubit.saveTrip(
                tripId: tripId,
                userId: userId!,
              );
            }
          },
        ),
      );
    });
  }
}
