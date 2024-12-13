part of 'payment_cubit.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {}

final class PaymentLoadInProgress extends PaymentState {}

final class PaymentCheckoutSuccess extends PaymentState {
  final String checkoutUrl;

  const PaymentCheckoutSuccess({required this.checkoutUrl});
  @override
  List<Object> get props => [checkoutUrl];
}

final class PaymentCheckoutFailure extends PaymentState {
  final String errorMessage;

  const PaymentCheckoutFailure({required this.errorMessage});
}

final class PaymentMethodChanged extends PaymentState {
  final String paymentMethod;

  const PaymentMethodChanged({required this.paymentMethod});

  @override
  List<Object> get props => [paymentMethod];
}

class PaymentInitialDepositChanged extends PaymentState {
  final int initialDeposit;

  const PaymentInitialDepositChanged({required this.initialDeposit});

  @override
  List<Object> get props => [initialDeposit];
}
