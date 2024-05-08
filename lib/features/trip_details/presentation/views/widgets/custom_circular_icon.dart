import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/utils/app_colors.dart';

class CustomCircularIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const CustomCircularIcon({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        backgroundColor: AppColors.whiteColor,
        radius: 24.r,
        child: Icon(
          icon,
          color: AppColors.secondaryColor,
          size: 28.sp,
        ),
      ),
    );
  }
}
