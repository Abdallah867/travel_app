import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/utils/app_colors.dart';
import 'package:travel_app/core/widgets/custom_button.dart';
import 'package:travel_app/core/widgets/horizontal_space.dart';
import 'package:travel_app/features/trip_details/presentation/views/widgets/custom_circular_icon.dart';

import '../../../../core/utils/app_strings.dart';

class BookingAndTripPlanButton extends StatelessWidget {
  const BookingAndTripPlanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          CustomCircularIcon(
            radius: 36,
            bgColor: AppColors.greyBlueColor,
            icon: Icons.calendar_month_outlined,
            onPressed: () {},
          ),
          const HorizontalSpace(size: 12),
          Expanded(
            child: CustomButton(
              text: AppStrings.bookNow,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
