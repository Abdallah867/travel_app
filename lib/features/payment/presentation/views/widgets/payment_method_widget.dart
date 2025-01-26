import '../../../../../core/enums/payment_method.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../manager/cubit/payment_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodWidget extends StatelessWidget {
  final String name;
  final PaymentMethod paymentMethod;
  final String image;

  const PaymentMethodWidget({
    super.key,
    required this.name,
    required this.paymentMethod,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                padding: const EdgeInsets.all(8),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: AppColors.inputGrey,
                  borderRadius: BorderRadius.circular(8.r),
                  // image: DecorationImage(
                  //   image: AssetImage(image),
                  // ),
                ),
                child: Image.asset(image)),
            const SizedBox(width: 20),
            Text(
              name,
              style: TextStyles.textStyle14
                  .copyWith(fontWeight: FontWeightHelper.bold),
            ),
          ],
        ),
        BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            return Transform.scale(
              scale: 2.0,
              child: CupertinoRadio(
                activeColor: AppColors.secondaryColor,
                value: paymentMethod,
                groupValue: context.read<PaymentCubit>().paymentMethod,
                onChanged: (value) {
                  context
                      .read<PaymentCubit>()
                      .selectPaymentMethod(paymentMethod);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
