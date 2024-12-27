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
    return Container(
      width: 130.w,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TravelAgencyLogo(),
          SizedBox(height: 8.h),
          Text(
            agency.agnecyName,
            style: TextStyles.textStyle14,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReviewWidget(
                review: agency.rating!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/text_styles.dart';
// import '../../../../trip/presentation/views/widgets/review_widget.dart';
// import '../../../data/models/agency_model.dart';
// import 'travel_agency_logo.dart';

// class TravelAgencyCard extends StatelessWidget {
//   final AgencyModel agency;
//   final bool isHorizontal; // New variable to determine layout direction

//   const TravelAgencyCard({
//     super.key,
//     required this.agency,
//     this.isHorizontal = true, // Default to horizontal layout
//   });

//   @override
//   Widget build(BuildContext context) {
//     return isHorizontal
//         ? Container(
//             width: 280.w,
//             height: 100.h,
//             decoration: BoxDecoration(
//               color: AppColors.whiteColor,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   blurRadius: 4,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const TravelAgencyLogo(),
//                 SizedBox(width: 12.w),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         agency.agnecyName,
//                         style: TextStyles.textStyle16,
//                       ),
//                       SizedBox(height: 4.h),
//                       ReviewWidget(
//                         review: agency.rating!,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         : Container(
//             width: 100.w,
//             height: 100.w, // Square container
//             decoration: BoxDecoration(
//               color: AppColors.whiteColor,
//               borderRadius: BorderRadius.circular(16),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   blurRadius: 4,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const TravelAgencyLogo(),
//                 SizedBox(height: 8.h),
//                 Text(
//                   agency.agnecyName,
//                   style: TextStyles.textStyle16,
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 4.h),
//                 ReviewWidget(
//                   review: agency.rating!,
//                 ),
//               ],
//             ),
//           );
//   }
// }
