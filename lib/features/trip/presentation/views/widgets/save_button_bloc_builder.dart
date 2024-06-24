import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../manager/saved_trips_cubit.dart/saved_trips_cubit.dart';
import '../../manager/trip_cubit/trip_cubit.dart';
import 'custom_circular_icon.dart';

class SaveButtonBlocBuilder extends StatelessWidget {
  const SaveButtonBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SavedTripsCubit saveTripCubit =
        BlocProvider.of<SavedTripsCubit>(context);

    final userId =
        BlocProvider.of<CurrentAccountCubit>(context).userInformations?.userId;
    final tripId = BlocProvider.of<TripCubit>(context).trip.tripId;
    return BlocBuilder<SavedTripsCubit, SavedTripsState>(
        builder: (context, state) {
      return saveTripCubit.isSaved(tripId)
          ? AbsorbPointer(
              absorbing: state is SavedTripsLoadInProgress ? true : false,
              child: CustomCircularIcon(
                icon: Icons.bookmark,
                onPressed: () {
                  saveTripCubit.unsaveTrip(tripId: tripId, userId: userId!);
                },
              ),
            )
          : AbsorbPointer(
              absorbing: state is SavedTripsLoadInProgress ? true : false,
              child: CustomCircularIcon(
                icon: Icons.bookmark_outline,
                onPressed: () {
                  saveTripCubit.saveTrip(tripId: tripId, userId: userId!);
                },
              ),
            );
    });
  }
}
