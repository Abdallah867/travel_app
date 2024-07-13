// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'traveler_model.dart';

class ReservationModel {
  final String reservationId;
  final String user;
  final List<TravelerModel> travelers;
  final String tripSchedule;
  ReservationModel({
    required this.reservationId,
    required this.user,
    required this.travelers,
    required this.tripSchedule,
  });

  ReservationModel copyWith({
    String? reservationId,
    String? user,
    List<TravelerModel>? travelers,
    String? tripSchedule,
  }) {
    return ReservationModel(
      reservationId: reservationId ?? this.reservationId,
      user: user ?? this.user,
      travelers: travelers ?? this.travelers,
      tripSchedule: tripSchedule ?? this.tripSchedule,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reservationId': reservationId,
      'user': user,
      'travelers': travelers.map((x) => x.toMap()).toList(),
      'tripSchedule': tripSchedule,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      reservationId: map['reservationId'] as String,
      user: map['user'] as String,
      travelers: List<TravelerModel>.from(
        (map['travelers'] as List<int>).map<TravelerModel>(
          (x) => TravelerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      tripSchedule: map['tripSchedule'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationModel.fromJson(String source) =>
      ReservationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReservationModel(reservationId: $reservationId, user: $user, travelers: $travelers, tripSchedule: $tripSchedule)';
  }
}
