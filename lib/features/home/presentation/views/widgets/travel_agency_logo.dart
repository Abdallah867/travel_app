import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_assets.dart';

class TravelAgencyLogo extends StatelessWidget {
  const TravelAgencyLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50.r,
      backgroundImage: const AssetImage(AppAssets.travelAgencyLogo),
    );
  }
}
