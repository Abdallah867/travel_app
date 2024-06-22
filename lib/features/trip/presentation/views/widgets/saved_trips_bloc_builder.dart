import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/get_saved_trips_cubit.dart/get_saved_trips_cubit.dart';
import 'save_trip_list_view.dart';
import 'save_trip_list_view_shimmer.dart';
import 'shimmer_trips_list_view.dart';

class SavedTripsBlocBuilder extends StatelessWidget {
  const SavedTripsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSavedTripsCubit, GetSavedTripsState>(
      builder: (context, state) {
        if (state is GetSavedTripsLoadInProgress) {
          return const CustomScrollView(slivers: [ShimmerTripsListView()]);
        } else if (state is GetSavedTripsSuccess) {
          return const CustomScrollView(slivers: [SaveTripListView()]);
        } else {
          return const Text('an error occured');
        }
      },
    );
  }
}
