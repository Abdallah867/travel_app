import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/sliver_text.dart';
import '../../../../home/presentation/manager/trips_cubit/trips_cubit.dart';
import 'shimmer_trips_list.dart';
import 'trips_list.dart';

class TripsListBlocBuilder extends StatelessWidget {
  const TripsListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsCubit, TripsState>(
      builder: (context, state) {
        final trips = context.read<TripsCubit>().trips;

        if (state is TripsLoadInProgess) {
          return const ShimmerTripsList();
        } else if (state is TripsLoaded) {
          return TripsList(trips: trips);
        } else {
          return const SliverText('an error occured');
        }
      },
    );
  }
}

// const CustomScrollView(
//           slivers: [
//             SavedTripsBlocBuilder(),
//           ],