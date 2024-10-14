// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../trip/data/models/trip_model.dart';

class TripScheduleModel {
  final String tripScheduleId;
  final String departureDate;
  final String returnDate;
  final int seatsAvailable;
  final TripModel trip;
  TripScheduleModel({
    required this.tripScheduleId,
    required this.departureDate,
    required this.returnDate,
    required this.seatsAvailable,
    required this.trip,
  });

  TripScheduleModel copyWith({
    String? tripScheduleId,
    String? departureDate,
    String? returnDate,
    int? seatsAvailable,
    TripModel? trip,
  }) {
    return TripScheduleModel(
      tripScheduleId: tripScheduleId ?? this.tripScheduleId,
      departureDate: departureDate ?? this.departureDate,
      returnDate: returnDate ?? this.returnDate,
      seatsAvailable: seatsAvailable ?? this.seatsAvailable,
      trip: trip ?? this.trip,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tripScheduleId': tripScheduleId,
      'departureDate': departureDate,
      'returnDate': returnDate,
      'seatsAvailable': seatsAvailable,
      'trip': trip.toMap(),
    };
  }

  factory TripScheduleModel.fromMap(Map<String, dynamic> map) {
    return TripScheduleModel(
      tripScheduleId: map['tripScheduleId'] as String,
      departureDate: map['departureDate'] as String,
      returnDate: map['returnDate'] as String,
      seatsAvailable: map['seatsAvailable'] as int,
      trip: TripModel.fromMap(map['trip'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TripScheduleModel.fromJson(String source) =>
      TripScheduleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TripScheduleModel(tripScheduleId: $tripScheduleId, departureDate: $departureDate, returnDate: $returnDate, seatsAvailable: $seatsAvailable, trip: $trip)';
  }

  @override
  bool operator ==(covariant TripScheduleModel other) {
    if (identical(this, other)) return true;

    return other.tripScheduleId == tripScheduleId &&
        other.departureDate == departureDate &&
        other.returnDate == returnDate &&
        other.seatsAvailable == seatsAvailable &&
        other.trip == trip;
  }

  @override
  int get hashCode {
    return tripScheduleId.hashCode ^
        departureDate.hashCode ^
        returnDate.hashCode ^
        seatsAvailable.hashCode ^
        trip.hashCode;
  }
}
