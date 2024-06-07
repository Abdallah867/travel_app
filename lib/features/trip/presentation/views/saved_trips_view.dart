import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/services/service_locator.dart';
import '../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../data/repos/trip_repo_impl.dart';
import '../manager/get_saved_trips_cubit.dart/get_saved_trips_cubit.dart';
import 'widgets/saved_trips_bloc_builder.dart';

class SavedTripsView extends StatelessWidget {
  const SavedTripsView({super.key});

  @override
  Widget build(BuildContext context) {
    final userId =
        BlocProvider.of<CurrentAccountCubit>(context).userInformations?.userId;

    return BlocProvider(
      create: (context) =>
          GetSavedTripsCubit(tripRepo: getIt.get<TripRepoImpl>())
            ..getSavedTrips(userId: userId!),
      child: Scaffold(
        appBar: customAppBar('Saved Trips'),
        body: const SavedTripsBlocBuilder(),
      ),
    );
  }
}
