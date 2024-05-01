import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import 'card_informations.dart';
import 'trip_image.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(32.r)),
        color: AppColors.whiteColor,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TripImage(),
            CardInformations(),
          ],
        ),
      ),
    );
  }
}
