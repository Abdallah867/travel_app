part of 'payment_cubit.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {}

final class PaymentCheckoutSuccess extends PaymentState {
  final String checkoutUrl;

  const PaymentCheckoutSuccess({required this.checkoutUrl});
}

final class PaymentCheckoutFailure extends PaymentState {
  final String errorMessage;

  const PaymentCheckoutFailure({required this.errorMessage});
}
