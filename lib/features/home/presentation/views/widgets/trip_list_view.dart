import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'trip_card.dart';
import '../../../../trip/presentation/manager/trip_details_cubit/trip_cubit.dart';
import '../../../../trip/presentation/manager/trips_cubit/trips_cubit.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../trip/data/models/trip_model.dart';

class TripListView extends StatelessWidget {
  const TripListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsCubit, TripsState>(
      builder: (context, state) {
        final tripsCubit = BlocProvider.of<TripsCubit>(context);
        List<TripModel> trips = tripsCubit.trips;

        return SizedBox(
          height: 300.h,
          child: ListView.separated(
              padding: EdgeInsets.only(left: 16.0.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) => BlocProvider(
                    create: (context) => TripCubit(
                      trip: trips[index],
                    ),
                    child: const TripCard(),
                  ),
              itemCount: trips.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const HorizontalSpace(size: 15)),
        );
      },
    );
  }
}
