import 'package:flutter/material.dart';

import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../trip/presentation/views/widgets/shimmer_trip_card.dart';

class PagedLoadingTripsList extends StatelessWidget {
  const PagedLoadingTripsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        VerticalSpace(size: 16),
        ShimmerTripCard(),
        VerticalSpace(size: 16),
        ShimmerTripCard(),
        VerticalSpace(size: 16),
        ShimmerTripCard(),
        VerticalSpace(size: 16),
        ShimmerTripCard(),
        VerticalSpace(size: 16),
        ShimmerTripCard(),
      ],
    );
  }
}
