import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../trip/presentation/views/widgets/shimmer_trips_list.dart';
import '../../../../trip/presentation/views/widgets/trips_list.dart';
import '../../manager/trips_cubit/trips_cubit.dart';
import 'title_section.dart';
import 'travel_agencies_list_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: VerticalSpace(size: 50)),
        SliverToBoxAdapter(
            child: TitleSection(title: AppStrings.travelAgencies)),
        SliverToBoxAdapter(child: VerticalSpace(size: 8)),
        SliverToBoxAdapter(child: TravelAgenciesListView()),
        SliverToBoxAdapter(child: VerticalSpace(size: 28)),
        SliverToBoxAdapter(
            child: TitleSection(
          title: AppStrings.availableTrips,
        )),
        SliverToBoxAdapter(child: VerticalSpace(size: 8)),
        TripsListBlocBuilder(),
      ],
    );
  }
}

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
          return const Text('an error occured');
        }
      },
    );
  }
}
