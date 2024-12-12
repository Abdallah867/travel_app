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
  final List<Map<String, dynamic>>? metadata; // Make metadata nullable

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
    this.metadata, // Default to null if not provided
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
    List<Map<String, dynamic>>? metadata,
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
      metadata: metadata ?? this.metadata,
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
      'metadata': metadata, // Serialize metadata if not null
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
      metadata: map['metadata'] != null
          ? List<Map<String, dynamic>>.from(
              map['metadata'] as List,
            )
          : null, // Deserialize metadata if not null
    );
  }

  @override
  String toString() {
    return 'CheckoutModel(amount: $amount, paymentMethod: $paymentMethod, currency: $currency, successUrl: $successUrl, failureUrl: $failureUrl, webhookEndpoint: $webhookEndpoint, locale: $locale, chargilyPayFeesAllocation: $chargilyPayFeesAllocation, percentageDiscount: $percentageDiscount, metadata: $metadata)';
  }
}
