import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../../reservation/data/models/reservation_model.dart';
import '../../../reservation/data/models/traveler_model.dart';
import '../manager/cubit/payment_cubit.dart';
import 'widgets/initial_deposit.dart';
import 'widgets/payment_methods.dart';
import 'widgets/price_row.dart';

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
        child: BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentCheckoutSuccess) {
              context.go(AppRoutes.kCheckoutView, extra: state.checkoutUrl);
            }
          },
          builder: (context, state) {
            return state is PaymentLoadInProgress
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )
                : CustomButton(
                    text: 'Pay Now',
                    onPressed: () {
                      context.read<PaymentCubit>().createCheckout();
                    },
                  );
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
