import 'package:flutter/material.dart';
import 'package:travel_app/features/home/presentation/views/widgets/trip_list_view.dart';

class SavedTripsView extends StatelessWidget {
  const SavedTripsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: TripListView()),
    );
  }
}
