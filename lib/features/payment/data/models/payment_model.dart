// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaymentModel {
  final String paymentId;
  final double initialDepositPourcentage;
  final String status;
  final int totalPrice;

  PaymentModel({
    required this.paymentId,
    required this.initialDepositPourcentage,
    required this.status,
    required this.totalPrice,
  });

  PaymentModel copyWith({
    String? paymentId,
    double? initialDepositPourcentage,
    String? status,
    int? totalPrice,
  }) {
    return PaymentModel(
      paymentId: paymentId ?? this.paymentId,
      initialDepositPourcentage:
          initialDepositPourcentage ?? this.initialDepositPourcentage,
      status: status ?? this.status,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'paymentId': paymentId,
      'initialDepositPourcentage': initialDepositPourcentage,
      'status': status,
      'totalPrice': totalPrice,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      paymentId: map['\$id'] as String,
      initialDepositPourcentage: map['initialDepositPourcentage'] as double,
      status: map['status'] as String,
      totalPrice: map['totalPrice'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentModel.fromJson(String source) =>
      PaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentModel(paymentId: $paymentId, initialDepositPourcentage: $initialDepositPourcentage, status: $status, totalPrice: $totalPrice)';
  }
}
