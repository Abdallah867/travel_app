import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/horizontal_space.dart';

import '../../../../../core/utils/app_assets.dart';

class TravelAgencyLogo extends StatelessWidget {
  const TravelAgencyLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: CircleAvatar(
        radius: 24.r,
        backgroundImage: const AssetImage(AppAssets.travelAgencyLogo),
      ),
    );
  }
}
