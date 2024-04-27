import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import 'review_widget.dart';
import 'travel_agency_logo.dart';

class TravelAgencyCard extends StatelessWidget {
  const TravelAgencyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        tileColor: AppColors.whiteColor,
        leading: SizedBox(
          width: 52.w,
          // height: 50.h,
          child: const TravelAgencyLogo(),
        ),
        title: Text(
          'Travel DZ',
          style: TextStyles.textStyle16,
        ),
        subtitle: const ReviewWidget(),
      ),
    );
  }
}
