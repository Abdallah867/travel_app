import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../trip/data/models/trip_model.dart';
import '../../../data/models/checkout_model.dart';
import '../../../data/models/payment_method.dart';
import '../../../data/repos/payment_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo paymentRepo;
  final TripModel trip;

  PaymentCubit(this.paymentRepo, this.trip) : super(PaymentInitial());

  Future<void> createCheckout() async {
    final response = await paymentRepo.createCheckout(
      CheckoutModel(
        amount: trip.price,
        paymentMethod: PaymentMethod.cib,
        successUrl: 'https://edahabia.com',
      ),
    );
    response.fold(
        (checkoutUrl) => emit(PaymentCheckoutSuccess(checkoutUrl: checkoutUrl)),
        (failure) => PaymentCheckoutFailure(errorMessage: failure.errMessage));
  }
}
