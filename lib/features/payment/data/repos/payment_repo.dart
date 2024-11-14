import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/checkout_model.dart';

abstract class PaymentRepo {
  Future<Either<String, Failure>> createCheckout(CheckoutModel checkoutModel);
}
