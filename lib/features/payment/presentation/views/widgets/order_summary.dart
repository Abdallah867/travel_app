import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'price_row.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => SizedBox(
          height: 70.h,
          child: const PriceRow(
            price: 1000,
            title: '1 Adult Price', // Replace with dynamic data as needed
          ),
        ),
        childCount: 1, // Replace with the actual item count
      ),
    );
  }
}
