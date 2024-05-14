import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/routes/app_routes.dart';
import 'package:travel_app/core/utils/app_colors.dart';
import 'package:travel_app/core/widgets/custom_button.dart';
import 'package:travel_app/core/widgets/horizontal_space.dart';
import 'package:travel_app/features/trip_details/presentation/views/widgets/custom_circular_icon.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/text_styles.dart';

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
              onPressed: () {
                _dialogBuilder(context);
                // context.push(AppRoutes.kBookingView);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Details de Reservation',
          style: TextStyles.textStyle20,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nbr d\'Adultes',
                  style: TextStyles.textStyle14,
                ),
                const SmallButton(),
              ],
            ),
          ],
        ),
        actions: [
          CustomButton(
            text: 'Continue',
            onPressed: () {},
          ),
        ],
      );
    },
  );
}

class SmallButton extends StatelessWidget {
  const SmallButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secondaryColor,
          width: 2.0,
        ),
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(
          Icons.add,
          color: AppColors.secondaryColor,
          size: 20.sp,
        ),
      ),
    );
  }
}
