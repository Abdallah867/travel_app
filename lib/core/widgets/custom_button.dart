import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final double height;
  final double width;
  final TextStyle? style;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.color = AppColors.secondaryColor,
    this.height = 60,
    this.width = 330,
    this.style,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        foregroundColor: Colors.transparent,
        backgroundColor: color,
        minimumSize: Size(width.w, height.h),
      ),
      child: Text(
        text,
        style: style ?? TextStyles.textStyle20,
      ),
    );
  }
}
