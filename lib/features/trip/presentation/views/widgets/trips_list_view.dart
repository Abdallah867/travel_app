import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/vertical_widget.dart';
import '../../../data/models/trip_model.dart';
import '../../manager/trip_cubit/trip_cubit.dart';
import 'horizontal_trip_card.dart';

class TripsListView extends StatelessWidget {
  const TripsListView({
    super.key,
    required this.trips,
  });

  final List<TripModel> trips;

  @override
  Widget build(BuildContext context) {
    print('$trips');
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return BlocProvider(
            create: (context) => TripCubit(
              trip: trips[index],
            ),
            child: const Column(
              children: [
                HorizontalTripCard(),
                VerticalSpace(size: 16),
              ],
            ),
          );
        },
        childCount: trips.length < 5 ? trips.length : 5,
      ),
    );
  }
}
