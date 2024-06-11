import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/font_weight_helper.dart';
import '../utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final double height;
  final double width;
  final TextStyle? style;
  final VoidCallback? onPressed;
  final double borderRadius;
  final BorderSide borderSide;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    this.color = AppColors.secondaryColor,
    this.height = 60,
    this.width = double.infinity,
    this.style,
    this.onPressed,
    this.borderRadius = 50,
    this.borderSide = BorderSide.none,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          side: borderSide,
        ),
        backgroundColor: color,
        minimumSize: Size(width.w, height.h),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: style ??
                TextStyles.textStyle20.copyWith(
                  color: textColor ?? AppColors.whiteColor,
                  fontWeight: FontWeightHelper.bold,
                ),
          ),
        ],
      ),
    );
  }
}
