// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TripScheduleModel {
  final String departureDate;
  final String returnDate;
  final int seatsAvailable;
  TripScheduleModel({
    required this.departureDate,
    required this.returnDate,
    required this.seatsAvailable,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'departureDate': departureDate,
      'returnDate': returnDate,
      'seatsAvailable': seatsAvailable,
    };
  }

  factory TripScheduleModel.fromMap(Map<String, dynamic> map) {
    return TripScheduleModel(
      departureDate: map['departureDate'] as String,
      returnDate: map['returnDate'] as String,
      seatsAvailable: map['seatsAvailable'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TripScheduleModel.fromJson(String source) =>
      TripScheduleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TripScheduleModel(departureDate: $departureDate, returnDate: $returnDate, seatsAvailable: $seatsAvailable)';

  @override
  bool operator ==(covariant TripScheduleModel other) {
    if (identical(this, other)) return true;

    return other.departureDate == departureDate &&
        other.returnDate == returnDate &&
        other.seatsAvailable == seatsAvailable;
  }

  @override
  int get hashCode =>
      departureDate.hashCode ^ returnDate.hashCode ^ seatsAvailable.hashCode;

  TripScheduleModel copyWith({
    String? departureDate,
    String? returnDate,
    int? seatsAvailable,
  }) {
    return TripScheduleModel(
      departureDate: departureDate ?? this.departureDate,
      returnDate: returnDate ?? this.returnDate,
      seatsAvailable: seatsAvailable ?? this.seatsAvailable,
    );
  }
}
