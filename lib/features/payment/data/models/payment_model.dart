// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../reservation/data/models/reservation_model.dart';

class PaymentModel {
  final String paymentId;
  final double initialDepositPourcentage;
  final String status;
  final int totalPrice;
  final ReservationModel reservation;

  PaymentModel({
    required this.paymentId,
    required this.initialDepositPourcentage,
    required this.status,
    required this.totalPrice,
    required this.reservation,
  });

  PaymentModel copyWith({
    String? paymentId,
    double? initialDepositPourcentage,
    String? status,
    int? totalPrice,
    ReservationModel? reservation,
  }) {
    return PaymentModel(
      paymentId: paymentId ?? this.paymentId,
      initialDepositPourcentage:
          initialDepositPourcentage ?? this.initialDepositPourcentage,
      status: status ?? this.status,
      totalPrice: totalPrice ?? this.totalPrice,
      reservation: reservation ?? this.reservation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'paymentId': paymentId,
      'initialDepositPourcentage': initialDepositPourcentage,
      'status': status,
      'totalPrice': totalPrice,
      'reservation': reservation.toMap(),
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      paymentId: map['paymentId'] as String,
      initialDepositPourcentage: map['initialDepositPourcentage'] as double,
      status: map['status'] as String,
      totalPrice: map['totalPrice'] as int,
      reservation:
          ReservationModel.fromMap(map['reservation'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentModel.fromJson(String source) =>
      PaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentModel(paymentId: $paymentId, initialDepositPourcentage: $initialDepositPourcentage, status: $status, totalPrice: $totalPrice, reservation: $reservation)';
  }
}
