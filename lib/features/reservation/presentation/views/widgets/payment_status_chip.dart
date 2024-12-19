import '../../../../../core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';

class PaymentStatusChip extends StatelessWidget {
  final bool isPaid;

  const PaymentStatusChip({super.key, required this.isPaid});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isPaid ? Colors.green.shade100 : Colors.red.shade100,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        isPaid ? S.of(context).paid : S.of(context).unpaid,
        style: TextStyles.textStyle14SemiBold.copyWith(
          color: isPaid ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
