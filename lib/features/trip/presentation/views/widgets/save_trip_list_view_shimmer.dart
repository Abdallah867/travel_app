import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import 'shimmer_trip_card.dart';

class SaveTripListViewShimmer extends StatelessWidget {
  const SaveTripListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      // scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) => const ShimmerTripCard(),
      itemCount: 3,
      separatorBuilder: (BuildContext context, int index) =>
          const VerticalSpace(size: 16),
    );
  }
}
