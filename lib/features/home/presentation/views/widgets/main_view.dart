import 'package:flutter/material.dart';

import '../../../../../core/widgets/vertical_widget.dart';
import 'title_section.dart';
import 'travel_agencies_list_view.dart';
import 'trip_list_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: VerticalSpace(size: 50)),
        SliverToBoxAdapter(child: TitleSection()),
        SliverToBoxAdapter(child: VerticalSpace(size: 12)),
        SliverToBoxAdapter(child: TravelAgenciesListView()),
        SliverToBoxAdapter(child: VerticalSpace(size: 12)),
        SliverToBoxAdapter(child: TripListView()),
      ],
    );
  }
}
