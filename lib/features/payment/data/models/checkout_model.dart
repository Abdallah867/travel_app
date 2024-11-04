// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'payment_method.dart';

class CheckoutModel {
  final int amount;
  final PaymentMethod paymentMethod;
  final String currency;
  final String successUrl;
  final String locale;
  final String chargilyPayFeesAllocation;
  final int percentageDiscount;
  CheckoutModel({
    required this.amount,
    required this.paymentMethod,
    this.currency = 'dzd',
    required this.successUrl,
    this.locale = 'en',
    this.chargilyPayFeesAllocation = 'customer',
    this.percentageDiscount = 75,
  });

  CheckoutModel copyWith({
    int? amount,
    PaymentMethod? paymentMethod,
    String? currency,
    String? successUrl,
    String? locale,
    String? chargilyPayFeesAllocation,
    int? percentageDiscount,
  }) {
    return CheckoutModel(
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      currency: currency ?? this.currency,
      successUrl: successUrl ?? this.successUrl,
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
    return 'CheckoutModel(amount: $amount, paymentMethod: $paymentMethod, currency: $currency, successUrl: $successUrl, locale: $locale, chargilyPayFeesAllocation: $chargilyPayFeesAllocation, percentageDiscount: $percentageDiscount)';
  }

  @override
  bool operator ==(covariant CheckoutModel other) {
    if (identical(this, other)) return true;

    return other.amount == amount &&
        other.paymentMethod == paymentMethod &&
        other.currency == currency &&
        other.successUrl == successUrl &&
        other.locale == locale &&
        other.chargilyPayFeesAllocation == chargilyPayFeesAllocation &&
        other.percentageDiscount == percentageDiscount;
  }

  @override
  int get hashCode {
    return amount.hashCode ^
        paymentMethod.hashCode ^
        currency.hashCode ^
        successUrl.hashCode ^
        locale.hashCode ^
        chargilyPayFeesAllocation.hashCode ^
        percentageDiscount.hashCode;
  }
}
