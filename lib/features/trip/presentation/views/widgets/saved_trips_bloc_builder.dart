import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/saved_trips_cubit.dart/saved_trips_cubit.dart';
import 'save_trip_list_view.dart';
import 'shimmer_trips_list.dart';

class SavedTripsBlocBuilder extends StatelessWidget {
  const SavedTripsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedTripsCubit, SavedTripsState>(
      builder: (context, state) {
        if (state is SavedTripsLoadInProgress) {
          return const ShimmerTripsList();
        } else if (state is SavedTripsSuccess) {
          return const SaveTripList();
        } else {
          return const SliverFillRemaining(
            child: Center(
              child: Text('An error occured'),
            ),
          );
        }
      },
    );
  }
}
