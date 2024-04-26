import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalSpace extends StatelessWidget {
  final double size;
  const HorizontalSpace({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.h,
    );
  }
}
