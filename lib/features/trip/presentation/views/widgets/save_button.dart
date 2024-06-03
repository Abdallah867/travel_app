import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../data/repos/trip_repo_impl.dart';
import '../../manager/save_trips_cubit.dart/save_trips_cubit.dart';

import '../../manager/trip_details_cubit/trip_cubit.dart';
import 'custom_circular_icon.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SaveTripsCubit(tripRepo: getIt.get<TripRepoImpl>()),
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
    final SaveTripsCubit saveTripCubit =
        BlocProvider.of<SaveTripsCubit>(context);
    final userId = getIt.get<CurrentAccountCubit>().userInformations?.userId ??
        '662cd19aa97849b7e878';
    log(userId.toString());
    final tripId = BlocProvider.of<TripCubit>(context).trip.tripId;
    return BlocBuilder<SaveTripsCubit, SaveTripsState>(
        builder: (context, state) {
      return saveTripCubit.isTripSaved
          ? CustomCircularIcon(
              icon: Icons.bookmark,
              onPressed: () {
                saveTripCubit.unsaveTrip(tripId: tripId, userId: userId);
              },
            )
          : CustomCircularIcon(
              icon: Icons.bookmark_outline,
              onPressed: () {
                saveTripCubit.saveTrip(tripId: tripId, userId: userId);
              },
            );
    });
  }
}
