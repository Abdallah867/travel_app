import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/enums/payment_status.dart';
import '../../../../../core/utils/text_styles.dart';

class PaymentStatusChip extends StatelessWidget {
  final PaymentStatus status;

  const PaymentStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: status.chipColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        status.getName(context),
        style: TextStyles.textStyle14SemiBold.copyWith(
          color: status.chipTextColor,
        ),
      ),
    );
  }
}
