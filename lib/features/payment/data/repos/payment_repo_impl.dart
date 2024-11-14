import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/database_service.dart';
import '../models/checkout_model.dart';
import 'payment_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  final Dio dio;

  PaymentRepoImpl(
    this.dio,
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
}

class PaymentService {}
