import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomCircularIcon extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final double radius;
  final VoidCallback onPressed;
  const CustomCircularIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.bgColor = AppColors.whiteColor,
    this.iconColor = AppColors.secondaryColor,
    this.radius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        backgroundColor: bgColor,
        radius: radius.r,
        child: Icon(
          icon,
          color: iconColor,
          size: (radius + 4).sp,
        ),
      ),
    );
  }
}
