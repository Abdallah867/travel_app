// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'payment_method.dart';

class CheckoutModel {
  final int amount;
  final PaymentMethod paymentMethod;
  final String currency;
  final String successUrl;
  final String failureUrl;
  final String webhookEndpoint;
  final String locale;
  final String chargilyPayFeesAllocation;
  final int percentageDiscount;

  CheckoutModel({
    required this.amount,
    required this.paymentMethod,
    this.currency = 'dzd',
    required this.successUrl,
    required this.failureUrl,
    required this.webhookEndpoint,
    this.locale = 'en',
    this.chargilyPayFeesAllocation = 'customer',
    this.percentageDiscount = 0,
  });

  CheckoutModel copyWith({
    int? amount,
    PaymentMethod? paymentMethod,
    String? currency,
    String? successUrl,
    String? failureUrl,
    String? webhookEndpoint,
    String? locale,
    String? chargilyPayFeesAllocation,
    int? percentageDiscount,
  }) {
    return CheckoutModel(
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      currency: currency ?? this.currency,
      successUrl: successUrl ?? this.successUrl,
      failureUrl: failureUrl ?? this.failureUrl,
      webhookEndpoint: webhookEndpoint ?? this.webhookEndpoint,
      locale: locale ?? this.locale,
      chargilyPayFeesAllocation:
          chargilyPayFeesAllocation ?? this.chargilyPayFeesAllocation,
      percentageDiscount: percentageDiscount ?? this.percentageDiscount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'payment_method': paymentMethod.name,
      'currency': currency,
      'success_url': successUrl,
      'failure_url': failureUrl,
      'webhook_endpoint': webhookEndpoint,
      'locale': locale,
      'chargily_pay_fees_allocation': chargilyPayFeesAllocation,
      'percentage_discount': percentageDiscount,
    };
  }

  factory CheckoutModel.fromMap(Map<String, dynamic> map) {
    return CheckoutModel(
      amount: map['amount'] as int,
      paymentMethod: getEnumPaymentMethod(map['payment_method']),
      currency: map['currency'] as String,
      successUrl: map['success_url'] as String,
      failureUrl: map['failure_url'] as String,
      webhookEndpoint: map['webhook_endpoint'] as String,
      locale: map['locale'] as String,
      chargilyPayFeesAllocation: map['chargily_pay_fees_allocation'] as String,
      percentageDiscount: map['percentage_discount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckoutModel.fromJson(String source) =>
      CheckoutModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CheckoutModel(amount: $amount, paymentMethod: $paymentMethod, currency: $currency, successUrl: $successUrl, failureUrl: $failureUrl, webhookEndpoint: $webhookEndpoint, locale: $locale, chargilyPayFeesAllocation: $chargilyPayFeesAllocation, percentageDiscount: $percentageDiscount)';
  }
}
