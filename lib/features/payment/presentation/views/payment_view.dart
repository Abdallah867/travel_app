import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/font_weight_helper.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../../reservation/data/models/reservation_model.dart';
import '../../../reservation/data/models/traveler_model.dart';
import '../../data/models/payment_method.dart';
import '../manager/cubit/payment_cubit.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final ReservationModel reservation =
        context.read<PaymentCubit>().reservation;
    List<TravelerModel> travelers = reservation.travelers;

    return Scaffold(
      appBar: customAppBar('Payment'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
          text: 'Pay Now',
          onPressed: () {
            context.read<PaymentCubit>().createCheckout();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h, top: 96.h),
                    child: Text(
                      'Order Summary',
                      style: TextStyles.textStyle16SemiBold,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),

            // Dynamic ListView.builder section converted to SliverList
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount:
                      travelers.length, // Replace with the actual item count

                  (context, index) {
                return PriceRow(
                  price: reservation.tripSchedule.trip.price,
                  title:
                      '${travelers[index].firstName}\'s Price', // Replace with dynamic data as needed
                );
              }),
            ),

            // Static elements for remaining items
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Divider(),
                  const VerticalSpace(size: 8),
                  PriceRow(
                    price: context.read<PaymentCubit>().calculateTotalPayment(),
                    title: 'Total',
                    isBold: true,
                  ),
                ],
              ),
            ),

            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // const OrderSummary(),
                  const SizedBox(height: 24),
                  const PaymentMethods(),
                  const SizedBox(height: 24),
                  const InitialDeposit(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
        const PaymentMethodWidget(
          name: 'Edahabia Card',
          image: 'assets/images/alg_post_logo.png',
          paymentMethod: PaymentMethod.edahabia,
        ),
        const VerticalSpace(size: 8),
        const PaymentMethodWidget(
          name: 'CIB Card',
          image: 'assets/images/cib_logo.png',
          paymentMethod: PaymentMethod.cib,
        ),
      ],
    );
  }
}

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
    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentCheckoutSuccess) {
          context.push(AppRoutes.kCheckoutView, extra: state.checkoutUrl);
        }
      },
      child: Padding(
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
      ),
    );
  }
}
