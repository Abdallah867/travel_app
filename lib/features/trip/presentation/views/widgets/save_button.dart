import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../data/repos/trip_repo_impl.dart';
import '../../manager/saved_trips_cubit.dart/saved_trips_cubit.dart';
import 'save_button_bloc_builder.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final userId =
        BlocProvider.of<CurrentAccountCubit>(context).userInformations?.userId;

    return BlocProvider(
      create: (context) => SavedTripsCubit(tripRepo: getIt.get<TripRepoImpl>())
        ..getSavedTrips(userId: userId!)
        ..getSavedTripsIds(userId: userId),
      child: const SaveButtonBlocBuilder(),
    );
  }
}
