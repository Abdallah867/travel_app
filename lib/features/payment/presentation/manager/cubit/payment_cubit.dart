import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../reservation/data/models/reservation_model.dart';
import '../../../../trip/data/models/trip_model.dart';
import '../../../data/models/checkout_model.dart';
import '../../../data/models/payment_method.dart';
import '../../../data/repos/payment_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo paymentRepo;
  final ReservationModel reservation;
  PaymentMethod paymentMethod = PaymentMethod.edahabia;
  int initialDeposit = 15;
  int totalPayment = 0;

  PaymentCubit(this.paymentRepo, this.reservation) : super(PaymentInitial());

  Future<void> createCheckout() async {
    final response = await paymentRepo.createCheckout(
      CheckoutModel(
        failureUrl: '',
        amount: (calculateTotalPayment() * initialDeposit) ~/ 100,
        webhookEndpoint: 'https://6737265f1d67e7960d68.appwrite.global',
        paymentMethod: paymentMethod,
        successUrl: 'https://edahabia.com',
      ),
    );
    response.fold(
        (checkoutUrl) => emit(PaymentCheckoutSuccess(checkoutUrl: checkoutUrl)),
        (failure) => PaymentCheckoutFailure(errorMessage: failure.errMessage));
  }

  int calculateTotalPayment() {
    int totalPayment =
        (reservation.travelers.length) * (reservation.tripSchedule.trip.price);
    return totalPayment;
  }

  void selectPaymentMethod(PaymentMethod payment) {
    paymentMethod = payment;
    emit(PaymentMethodChanged(paymentMethod: payment.name));
  }

  void updateInitialDeposit(int newValue) {
    initialDeposit = newValue;
    emit(PaymentInitialDepositChanged(initialDeposit: newValue));
  }
}
