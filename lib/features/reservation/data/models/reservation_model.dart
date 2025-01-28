// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import '../../../payment/data/models/payment_model.dart';
import 'traveler_model.dart';
import 'trip_schedule_model.dart';

class ReservationModel {
  final String reservationId;
  final String userId;
  final List<TravelerModel> travelers;
  final TripScheduleModel tripSchedule;
  final PaymentModel? payment; // Made nullable

  ReservationModel({
    required this.reservationId,
    required this.userId,
    required this.travelers,
    required this.tripSchedule,
    this.payment, // Nullable field
  });

  ReservationModel copyWith({
    String? reservationId,
    String? userId,
    List<TravelerModel>? travelers,
    TripScheduleModel? tripSchedule,
    PaymentModel? payment,
  }) {
    return ReservationModel(
      reservationId: reservationId ?? this.reservationId,
      userId: userId ?? this.userId,
      travelers: travelers ?? this.travelers,
      tripSchedule: tripSchedule ?? this.tripSchedule,
      payment: payment ?? this.payment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reservationId': reservationId,
      'userId': userId,
      'travelers': travelers.map((x) => x.travelerId).toList(),
      'tripSchedule': tripSchedule.tripScheduleId,
      'payment': payment?.toMap(), // Handle nullable payment
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      reservationId: map['reservationId'] as String,
      userId: map['userId'] as String,
      travelers: List<TravelerModel>.from(
        (map['travelers']).map<TravelerModel>(
          (x) => TravelerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      tripSchedule: TripScheduleModel.fromMap(
        map['tripSchedule'] as Map<String, dynamic>,
      ),
      payment: map['payment'] != null
          ? PaymentModel.fromMap(map['payment'] as Map<String, dynamic>)
          : null, // Safely handle nullable and type
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationModel.fromJson(String source) =>
      ReservationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReservationModel(reservationId: $reservationId, userId: $userId, travelers: $travelers, tripSchedule: $tripSchedule, payment: $payment)';
  }
}
