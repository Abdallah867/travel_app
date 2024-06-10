import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/get_saved_trips_cubit.dart/get_saved_trips_cubit.dart';
import 'save_trip_list_view.dart';
import 'save_trip_list_view_shimmer.dart';

class SavedTripsBlocBuilder extends StatelessWidget {
  const SavedTripsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSavedTripsCubit, GetSavedTripsState>(
      builder: (context, state) {
        if (state is GetSavedTripsLoadInProgress) {
          return const Center(child: SaveTripListViewShimmer());
        } else if (state is GetSavedTripsSuccess) {
          return const Center(child: SaveTripListView());
        } else {
          return const Text('an error occured');
        }
      },
    );
  }
}
