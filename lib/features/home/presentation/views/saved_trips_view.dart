import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/horizontal_space.dart';
import '../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../trip/data/models/trip_model.dart';
import '../../../trip/data/repos/trip_repo_impl.dart';
import '../../../trip/presentation/manager/get_saved_trips_cubit.dart/get_saved_trips_cubit.dart';
import '../../../trip/presentation/manager/trip_details_cubit/trip_cubit.dart';
import 'widgets/trip_card.dart';

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
      child: const Scaffold(
        body: SavedTripsBlocBuilder(),
      ),
    );
  }
}

class SavedTripsBlocBuilder extends StatelessWidget {
  const SavedTripsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSavedTripsCubit, GetSavedTripsState>(
      builder: (context, state) {
        if (state is GetSavedTripsLoadInProgress) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetSavedTripsSuccess) {
          return const Center(child: SaveTripListView());
        } else {
          return const Text('an error occured');
        }
      },
    );
  }
}

class SaveTripListView extends StatelessWidget {
  const SaveTripListView({super.key});

  @override
  Widget build(BuildContext context) {
    final tripsCubit = BlocProvider.of<GetSavedTripsCubit>(context);
    List<TripModel> savedTrips = tripsCubit.savedTrips;

    if (savedTrips.isNotEmpty) {
      return SizedBox(
        height: 300.h,
        child: ListView.separated(
            padding: EdgeInsets.only(left: 16.0.w),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => BlocProvider(
                  create: (context) => TripCubit(
                    trip: savedTrips[index],
                  ),
                  child: const TripCard(),
                ),
            itemCount: savedTrips.length,
            separatorBuilder: (BuildContext context, int index) =>
                const HorizontalSpace(size: 15)),
      );
    } else {
      return const Text('No Saved Trips');
    }
  }
}
