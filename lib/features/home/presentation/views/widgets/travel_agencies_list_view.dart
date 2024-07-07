import 'package:flutter/material.dart';

import '../../../../../core/widgets/horizontal_list_view.dart';
import 'travel_agency_card.dart';

class TravelAgenciesListView extends StatelessWidget {
  const TravelAgenciesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HorizontalListView(
      itemCount: 5,
      child: TravelAgencyCard(),
    );
  }
}
