import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'font_weight_helper.dart';

abstract class TextStyles {
  static TextStyle textStyle28 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle textStyle20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle textStyle20SemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle textStyle16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle textStyle16WithOpacity = TextStyle(
    color: Colors.black.withOpacity(.4),
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle textStyle14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
}
