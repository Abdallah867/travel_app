import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import 'custom_circular_icon.dart';

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
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VerticalSpace(size: 12),
            CounterSection(
              title: 'Adultes',
            ),
            VerticalSpace(size: 16),
            CounterSection(
              title: 'Enfants',
            ),
            VerticalSpace(size: 12),
          ],
        ),
        actions: [
          CustomButton(
            text: 'Continue',
            onPressed: () {
              context.pop();
            },
          ),
        ],
      );
    },
  );
}

class CounterSection extends StatelessWidget {
  final String title;
  const CounterSection({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Nbr d\'$title',
          style: TextStyles.textStyle14,
        ),
        const CustomCounter(),
      ],
    );
  }
}

class CustomCounter extends StatefulWidget {
  const CustomCounter({
    super.key,
  });

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SmallButton(
            icon: Icons.remove,
            onPressed: () {
              setState(() {
                count--;
              });
            }),
        const HorizontalSpace(size: 12),
        Text(
          count.toString(),
          style: TextStyles.textStyle20,
        ),
        const HorizontalSpace(size: 12),
        SmallButton(
            icon: Icons.add,
            onPressed: () {
              setState(() {
                count++;
              });
            }),
      ],
    );
  }
}

class SmallButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const SmallButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.secondaryColor,
            width: 2.0,
          ),
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.01),
          child: Icon(
            icon,
            color: AppColors.secondaryColor,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
