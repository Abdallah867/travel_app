import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';

class TravelAgencyLogo extends StatelessWidget {
  const TravelAgencyLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Image.asset(AppAssets.travelAgencyLogo),
    );
  }
}
