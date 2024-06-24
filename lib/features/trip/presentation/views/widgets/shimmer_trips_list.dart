import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import 'shimmer_trip_card.dart';

// class ShimmerTripsListView extends StatelessWidget {
//   const ShimmerTripsListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
//       child: SliverToBoxAdapter(
//         child: ListView.separated(
//           // scrollDirection: Axis.horizontal,
//           itemBuilder: (BuildContext context, int index) =>
//               const SizedBox(height: 50, child: ShimmerTripCard()),
//           itemCount: 5,
//           separatorBuilder: (BuildContext context, int index) =>
//               const VerticalSpace(size: 16),
//         ),
//       ),
//     );
//   }
// }

class ShimmerTripsList extends StatelessWidget {
  const ShimmerTripsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: const ShimmerTripCard());
        },
        childCount: 5,
      ),
    );
  }
}
