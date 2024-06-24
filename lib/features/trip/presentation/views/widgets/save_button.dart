import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../data/repos/trip_repo_impl.dart';
import '../../manager/saved_trips_cubit.dart/saved_trips_cubit.dart';
import '../../manager/trip_cubit/trip_cubit.dart';
import 'custom_circular_icon.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = getIt.get<CurrentAccountCubit>().userInformations?.userId;
    print(userId);

    return BlocProvider(
      create: (context) => SavedTripsCubit(tripRepo: getIt.get<TripRepoImpl>())
        ..getSavedTrips(userId: userId!)
        ..getSavedTripsIds(userId: userId),
      child: const SaveButtonBlocBuilder(),
    );
  }
}

class SaveButtonBlocBuilder extends StatelessWidget {
  const SaveButtonBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SavedTripsCubit saveTripCubit =
        BlocProvider.of<SavedTripsCubit>(context);

    // TODO: remove the userId from here
    final userId = getIt.get<CurrentAccountCubit>().userInformations?.userId;
    final tripId = BlocProvider.of<TripCubit>(context).trip.tripId;
    print('$userId, $tripId');
    return BlocBuilder<SavedTripsCubit, SavedTripsState>(
        builder: (context, state) {
      return saveTripCubit.isSaved(tripId)
          ? CustomCircularIcon(
              icon: Icons.bookmark,
              onPressed: () {
                saveTripCubit.unsaveTrip(tripId: tripId, userId: userId!);
              },
            )
          : CustomCircularIcon(
              icon: Icons.bookmark_outline,
              onPressed: () {
                saveTripCubit.saveTrip(tripId: tripId, userId: userId!);
              },
            );
    });
  }
}
