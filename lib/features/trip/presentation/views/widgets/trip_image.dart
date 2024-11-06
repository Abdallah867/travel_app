import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripImage extends StatelessWidget {
  const TripImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      height: 208.h,
      width: 208.w,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(24.r)),
      ),
    );
  }
}
