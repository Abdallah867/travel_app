import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/vertical_widget.dart';
import '../../../data/models/trip_model.dart';
import '../../manager/get_saved_trips_cubit.dart/get_saved_trips_cubit.dart';
import '../../manager/trip_cubit/trip_cubit.dart';
import 'horizontal_trip_card.dart';

class SaveTripListView extends StatelessWidget {
  const SaveTripListView({super.key});

  @override
  Widget build(BuildContext context) {
    final tripsCubit = BlocProvider.of<GetSavedTripsCubit>(context);
    List<TripModel> savedTrips = tripsCubit.savedTrips;

    if (savedTrips.isNotEmpty) {
      return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        // scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => BlocProvider(
          create: (context) => TripCubit(
            trip: savedTrips[index],
          ),
          child: const HorizontalTripCard(),
        ),
        itemCount: savedTrips.length,
        separatorBuilder: (BuildContext context, int index) =>
            const VerticalSpace(size: 16),
      );
    } else {
      return const Center(child: Text('No Saved Trips'));
    }
  }
}
