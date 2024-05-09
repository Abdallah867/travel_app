import 'package:flutter/material.dart';

import '../../../../core/widgets/vertical_widget.dart';
import 'booking_and_trip_plan_button.dart';
import 'custom_trip_detail_image.dart';
import 'custom_trip_details_app_bar.dart';
import 'widgets/trip_informations_widget.dart';

class TripDetailsView extends StatelessWidget {
  final String tripId;
  const TripDetailsView({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BookingAndTripPlanButton(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  CustomTripDetailImage(),
                  CustomTripDetailsAppBar(),
                ],
              ),
            ),
            SliverToBoxAdapter(child: VerticalSpace(size: 96)),
            SliverToBoxAdapter(child: TripInformationsWidget()),
          ],
        ),
      ),
    );
  }
}
