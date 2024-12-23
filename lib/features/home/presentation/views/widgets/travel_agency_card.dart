import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../trip/presentation/views/widgets/review_widget.dart';
import '../../../data/models/agency_model.dart';
import 'travel_agency_logo.dart';

class TravelAgencyCard extends StatelessWidget {
  final AgencyModel agency;
  const TravelAgencyCard({super.key, required this.agency});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280.w,
      height: 100.h,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 12.w,
        minVerticalPadding: 16.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        tileColor: AppColors.whiteColor,
        leading: const TravelAgencyLogo(),
        title: Text(
          agency.agnecyName,
          style: TextStyles.textStyle16,
        ),
        subtitle: const ReviewWidget(),
      ),
    );
  }
}
