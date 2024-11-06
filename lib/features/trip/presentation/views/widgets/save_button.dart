import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/saved_trips_cubit.dart/saved_trips_cubit.dart';
import '../../manager/trip_cubit/trip_cubit.dart';
import 'save_button_bloc_builder.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final tripCubit = BlocProvider.of<TripCubit>(context);
    final savedTripCubit = BlocProvider.of<SavedTripsCubit>(context);

    return BlocListener<SavedTripsCubit, SavedTripsState>(
      listener: (context, state) {
        if (state is SavedTripsSuccess) {
          tripCubit.savedTripsIds = savedTripCubit.savedTripsIds();
          tripCubit.checkIfTripSaved(tripCubit.savedTripsIds);
        }
      },
      child: const SaveButtonBlocBuilder(),
    );
  }
}
