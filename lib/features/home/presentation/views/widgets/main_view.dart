import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../trip/data/repos/trip_repo_impl.dart';
import '../../manager/trips_cubit/trips_cubit.dart';
import 'title_section.dart';
import 'travel_agencies_list_view.dart';
import '../../../../trip/presentation/views/widgets/trip_list_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: VerticalSpace(size: 50)),
        const SliverToBoxAdapter(
            child: TitleSection(title: AppStrings.travelAgencies)),
        const SliverToBoxAdapter(child: VerticalSpace(size: 8)),
        const SliverToBoxAdapter(child: TravelAgenciesListView()),
        const SliverToBoxAdapter(child: VerticalSpace(size: 28)),
        const SliverToBoxAdapter(
            child: TitleSection(
          title: AppStrings.availableTrips,
        )),
        const SliverToBoxAdapter(child: VerticalSpace(size: 8)),
        SliverToBoxAdapter(
            child: BlocProvider(
          create: (context) => TripsCubit(
            tripRepo: getIt.get<TripRepoImpl>(),
          )..getTrips(),
          child: const TripListView(),
        )),
      ],
    );
  }
}
