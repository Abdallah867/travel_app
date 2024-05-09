import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/features/trip_details/presentation/views/widgets/custom_circular_icon.dart';
import 'package:travel_app/features/trip_details/presentation/views/widgets/save_button.dart';

class CustomTripDetailsAppBar extends StatelessWidget {
  const CustomTripDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCircularIcon(
            icon: Icons.arrow_back_ios_new,
            onPressed: () => context.pop(),
          ),
          const SaveButton(),
        ],
      ),
    );
  }
}
