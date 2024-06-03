import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/vertical_widget.dart';
import '../manager/trip_details_cubit/trip_cubit.dart';
import 'widgets/booking_and_trip_plan_button.dart';
import 'widgets/custom_trip_detail_image.dart';
import 'widgets/custom_trip_details_app_bar.dart';
import 'widgets/trip_informations_widget.dart';

class TripDetailsView extends StatelessWidget {
  const TripDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BookingAndTripPlanButton(),
      body: BlocBuilder<TripCubit, TripState>(
        builder: (context, state) {
          return const SafeArea(
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
          );
        },
      ),
    );
  }
}
