import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class TextStyles {
  static TextStyle textStyle20 = TextStyle(
    fontSize: 20.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.normal,
  );

  static TextStyle textStyle30WithAclonica = GoogleFonts.aclonica(
    fontSize: 30.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle textStyle40WithAclonica = GoogleFonts.aclonica(
    fontSize: 40.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle textStyle20Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textStyle13 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle textStyle12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textStyle8 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w100,
    color: Colors.blueGrey[100],
  );
}
