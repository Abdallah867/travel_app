import '../../../../../core/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
