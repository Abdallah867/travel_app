import '../../../../../core/enums/payment_method.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../manager/cubit/payment_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'payment_method_widget.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Methods',
          style: TextStyles.textStyle16SemiBold,
          textAlign: TextAlign.start,
        ),
        const VerticalSpace(size: 16),
        GestureDetector(
          onTap: () {
            context
                .read<PaymentCubit>()
                .selectPaymentMethod(PaymentMethod.edahabia);
          },
          child: const PaymentMethodWidget(
            name: 'Edahabia Card',
            image: 'assets/images/alg_post_logo.png',
            paymentMethod: PaymentMethod.edahabia,
          ),
        ),
        const VerticalSpace(size: 8),
        GestureDetector(
          onTap: () {
            context.read<PaymentCubit>().selectPaymentMethod(PaymentMethod.cib);
          },
          child: const PaymentMethodWidget(
            name: 'CIB Card',
            image: 'assets/images/cib_logo.png',
            paymentMethod: PaymentMethod.cib,
          ),
        ),
      ],
    );
  }
}
