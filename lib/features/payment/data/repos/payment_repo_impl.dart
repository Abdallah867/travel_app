import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/database_service.dart';
import '../models/checkout_model.dart';
import '../models/payment_model.dart';
import 'payment_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  final Dio dio;
  final DatabaseService databaseService;
  PaymentRepoImpl(
    this.dio,
    this.databaseService,
  );

  @override
  Future<Either<String, Failure>> createCheckout(
    CheckoutModel checkoutModel,
  ) async {
    try {
      final response = await dio.post('${dotenv.env['CHARGILY_URL']}/checkouts',
          data: checkoutModel.toMap(),
          options: Options(headers: {
            'Authorization': 'Bearer ${dotenv.env['CHARGILY_API_KEY']}',
            'Content-Type': 'application/json',
          }));

      print(response.data['checkout_url']);

      return left(response.data['checkout_url']);
    } on DioException catch (e) {
      return right(
          Failure(errMessage: e.message ?? 'Some unexpected error occurred'));
    } catch (e) {
      return right(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<PaymentModel, Failure>> createPayment(
      PaymentModel payment) async {
    /// create payment in paymentCollectionEndpoint
    try {
      final response = await databaseService.create(
        data: payment.toMap(),
        endpoint: AppConstants.payementsCollectionEndpoint,
        id: ID.unique(),
      );

      return left(PaymentModel.fromMap(response));
    } on AppwriteException catch (e) {
      return right(
        Failure(errMessage: e.message ?? 'Some unexpected error occurred'),
      );
    } catch (e) {
      return right(
        Failure(errMessage: e.toString()),
      );
    }
  }
}
