import '../../../../../core/utils/text_styles.dart';
import '../../manager/cubit/payment_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitialDeposit extends StatelessWidget {
  const InitialDeposit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Initial Deposit',
          style: TextStyles.textStyle16SemiBold,
          textAlign: TextAlign.start,
        ),
        BlocBuilder<PaymentCubit, PaymentState>(
          builder: (context, state) {
            return Slider(
              value: context.read<PaymentCubit>().initialDeposit.toDouble(),
              min: 15,
              max: 100,
              divisions: 100,
              label: "${context.read<PaymentCubit>().initialDeposit}%",
              onChanged: (double value) {
                context
                    .read<PaymentCubit>()
                    .updateInitialDeposit(value.toInt());
              },
            );
          },
        ),
      ],
    );
  }
}
