import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'custom_circular_icon.dart';
import 'save_button.dart';

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
