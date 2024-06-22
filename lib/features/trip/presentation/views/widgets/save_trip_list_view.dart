import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/trip_model.dart';
import '../../manager/get_saved_trips_cubit.dart/get_saved_trips_cubit.dart';
import 'trips_list_view.dart';

class SaveTripListView extends StatelessWidget {
  const SaveTripListView({super.key});

  @override
  Widget build(BuildContext context) {
    final tripsCubit = BlocProvider.of<GetSavedTripsCubit>(context);
    List<TripModel> savedTrips = tripsCubit.savedTrips;

    if (savedTrips.isNotEmpty) {
      return TripsListView(trips: savedTrips);
    } else {
      return const Center(child: Text('No Saved Trips'));
    }
  }
}
