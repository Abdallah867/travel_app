import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/features/home/presentation/views/widgets/trip_card.dart';
import '../../../../../core/widgets/horizontal_space.dart';

class TripListView extends StatelessWidget {
  const TripListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) => const TripCard(),
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) =>
              const HorizontalSpace(size: 15)),
    );
  }
}
