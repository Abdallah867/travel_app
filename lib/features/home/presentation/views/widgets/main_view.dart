import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../trip/presentation/views/widgets/trips_list_bloc_builder.dart';
import 'title_section.dart';
import 'travel_agencies_list_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const VerticalSpace(size: 50),
              const TitleSection(title: AppStrings.travelAgencies),
              const VerticalSpace(size: 8),
              const TravelAgenciesListView(),
              const VerticalSpace(size: 28),
              const VerticalSpace(size: 8),
              const TitleSection(
                title: AppStrings.availableTrips,
              ),
              const VerticalSpace(size: 8),
            ],
          ),
        ),
        const TripsListBlocBuilder(),
      ],
    );
  }
}
