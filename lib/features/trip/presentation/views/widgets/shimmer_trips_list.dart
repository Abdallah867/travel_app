import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'shimmer_trip_card.dart';

class ShimmerTripsList extends StatelessWidget {
  const ShimmerTripsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: const ShimmerTripCard());
          },
          childCount: 5,
        ),
      ),
    );
  }
}
