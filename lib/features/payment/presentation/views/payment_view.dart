import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/utils/font_weight_helper.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/vertical_widget.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Payment'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Order Summary',
              style: TextStyles.textStyle14
                  .copyWith(fontWeight: FontWeightHelper.bold),
              textAlign: TextAlign.start,
            ),
            const VerticalSpace(size: 8),
            const PriceRow(
              price: 1000,
              title: '1 Adult Price',
            ),
            const PriceRow(
              price: 1000,
              title: '1 Child Price',
            ),
            const PriceRow(
              price: 1000,
              title: 'Subtotal',
            ),
            const PriceRow(
              price: 1000,
              title: 'Fees',
            ),
            const Divider(),
            const VerticalSpace(size: 8),
            const PriceRow(
              price: 1000,
              title: 'Total',
              isBold: true,
            ),
          ],
        ),
      ),
    );
  }
}

class PriceRow extends StatelessWidget {
  final bool isBold;
  final int price;
  final String title;
  const PriceRow({
    super.key,
    required this.price,
    required this.title,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyles.textStyle14
                .copyWith(fontWeight: isBold ? FontWeight.bold : null),
          ),
          Text(
            '$price DA',
            style: TextStyles.textStyle14
                .copyWith(fontWeight: isBold ? FontWeight.bold : null),
          ),
        ],
      ),
    );
  }
}
