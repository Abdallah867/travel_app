import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/sliver_text.dart';
import '../../../data/models/trip_model.dart';
import '../../manager/saved_trips_cubit.dart/saved_trips_cubit.dart';
import 'trips_list.dart';

class SaveTripList extends StatelessWidget {
  const SaveTripList({super.key});

  @override
  Widget build(BuildContext context) {
    final tripsCubit = BlocProvider.of<SavedTripsCubit>(context);
    List<TripModel> savedTrips = [];

    if (savedTrips.isNotEmpty) {
      return TripsList(trips: savedTrips);
    } else {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text('No Saved Trips'),
        ),
      );
    }
  }
}
