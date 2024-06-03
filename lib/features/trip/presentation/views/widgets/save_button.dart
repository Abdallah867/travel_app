import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/core/networking/appwrite_service.dart';
import 'package:travel_app/core/services/service_locator.dart';
import 'package:travel_app/features/auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import 'package:travel_app/features/trip/data/repos/trip_repo_impl.dart';
import 'package:travel_app/features/trip/presentation/manager/save_trips_cubit.dart/save_trips_cubit.dart';

import 'custom_circular_icon.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SaveTripsCubit(
        tripRepo: TripRepoImpl(
          database: getIt.get<AppwriteService>(),
        ),
      ),
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
    final userId = getIt.get<CurrentAccountCubit>().userInformations?.userId;
    return BlocBuilder<SaveTripsCubit, SaveTripsState>(
        builder: (context, state) {
      return saveTripCubit.isTripSaved
          ? CustomCircularIcon(
              icon: Icons.bookmark,
              onPressed: () {
                if (userId != null) {
                  saveTripCubit.unsaveTrip(tripId: '12333', userId: userId);
                }
              },
            )
          : CustomCircularIcon(
              icon: Icons.bookmark_outline,
              onPressed: () {
                if (userId != null) {
                  saveTripCubit.saveTrip(tripId: '12333', userId: userId);
                }
              },
            );
    });
  }
}
