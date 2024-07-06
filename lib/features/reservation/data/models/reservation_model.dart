// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'traveler_model.dart';

class ReservationModel {
  final String reservationId;
  final String userId;
  final List<TravelerModel> travelers;
  final String choosenScheduleTripId;
  ReservationModel({
    required this.reservationId,
    required this.userId,
    required this.travelers,
    required this.choosenScheduleTripId,
  });

  ReservationModel copyWith({
    String? reservationId,
    String? userId,
    List<TravelerModel>? travelers,
    String? choosenScheduleTripId,
  }) {
    return ReservationModel(
      reservationId: reservationId ?? this.reservationId,
      userId: userId ?? this.userId,
      travelers: travelers ?? this.travelers,
      choosenScheduleTripId:
          choosenScheduleTripId ?? this.choosenScheduleTripId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reservationId': reservationId,
      'userId': userId,
      'travelers': travelers.map((x) => x.toMap()).toList(),
      'choosenScheduleTripId': choosenScheduleTripId,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      reservationId: map['reservationId'] as String,
      userId: map['userId'] as String,
      travelers: List<TravelerModel>.from(
        (map['travelers'] as List<int>).map<TravelerModel>(
          (x) => TravelerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      choosenScheduleTripId: map['choosenScheduleTripId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationModel.fromJson(String source) =>
      ReservationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReservationModel(reservationId: $reservationId, userId: $userId, travelers: $travelers, choosenScheduleTripId: $choosenScheduleTripId)';
  }

  @override
  bool operator ==(covariant ReservationModel other) {
    if (identical(this, other)) return true;

    return other.reservationId == reservationId &&
        other.userId == userId &&
        listEquals(other.travelers, travelers) &&
        other.choosenScheduleTripId == choosenScheduleTripId;
  }

  @override
  int get hashCode {
    return reservationId.hashCode ^
        userId.hashCode ^
        travelers.hashCode ^
        choosenScheduleTripId.hashCode;
  }
}
