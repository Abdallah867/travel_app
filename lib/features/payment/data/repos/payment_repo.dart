import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/checkout_model.dart';
import '../models/payment_model.dart';

abstract class PaymentRepo {
  Future<Either<String, Failure>> createCheckout(CheckoutModel checkoutModel);
  Future<Either<PaymentModel, Failure>> createPayment(PaymentModel payment);
}
