import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/widgets/horizontal_space.dart';

import '../../../../../../core/utils/app_assets.dart';

class TravelAgencyLogo extends StatelessWidget {
  const TravelAgencyLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const HorizontalSpace(
          size: 12,
        ),
        CircleAvatar(
          radius: 36.r,
          backgroundImage: const AssetImage(AppAssets.travelAgencyLogo),
        ),
      ],
    );
  }
}
