import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> showCancelBookingDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(
          'Are you sure you want to cancel the trip?',
          style: TextStyles.textStyle16SemiBold,
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  color: Colors.transparent,
                  borderSide: const BorderSide(
                    color: AppColors.inputGrey,
                    width: 2,
                  ),
                  text: 'No, I change my mind',
                  style: TextStyles.textStyle14SemiBold.copyWith(
                    color: Colors.black.withOpacity(.5),
                  ),
                  height: 40.h,
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
              const HorizontalSpace(size: 16),
              Expanded(
                child: CustomButton(
                  text: 'Yes, Cancel Trip',
                  color: Colors.transparent,
                  style: TextStyles.textStyle14SemiBold.copyWith(
                    color: Colors.red,
                  ),
                  height: 40.h,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
