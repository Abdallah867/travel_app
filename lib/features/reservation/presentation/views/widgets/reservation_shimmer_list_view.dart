import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_shimmer.dart';
import '../../../../../core/widgets/horizontal_space.dart';

class ReservationShimmerListView extends StatelessWidget {
  const ReservationShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return const CustomShimmer.box(height: 100, width: 90);
        },
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (BuildContext context, int index) {
          return const HorizontalSpace(size: 15);
        },
      ),
    );
  }
}
