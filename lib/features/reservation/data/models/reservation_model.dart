// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../profile/data/models/user_model.dart';
import 'traveler_model.dart';

class ReservationModel {
  final String reservationId;
  final UserModel user;
  final List<TravelerModel> travelers;
  final String choosenTrip;
  ReservationModel({
    required this.reservationId,
    required this.user,
    required this.travelers,
    required this.choosenTrip,
  });

  ReservationModel copyWith({
    String? reservationId,
    UserModel? user,
    List<TravelerModel>? travelers,
    String? choosenTrip,
  }) {
    return ReservationModel(
      reservationId: reservationId ?? this.reservationId,
      user: user ?? this.user,
      travelers: travelers ?? this.travelers,
      choosenTrip: choosenTrip ?? this.choosenTrip,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reservationId': reservationId,
      'user': user.toMap(),
      'travelers': travelers.map((x) => x.toMap()).toList(),
      'choosenTrip': choosenTrip,
    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      reservationId: map['reservationId'] as String,
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
      travelers: List<TravelerModel>.from(
        (map['travelers'] as List<int>).map<TravelerModel>(
          (x) => TravelerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      choosenTrip: map['choosenTrip'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservationModel.fromJson(String source) =>
      ReservationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReservationModel(reservationId: $reservationId, user: $user, travelers: $travelers, choosenTrip: $choosenTrip)';
  }

  @override
  bool operator ==(covariant ReservationModel other) {
    if (identical(this, other)) return true;

    return other.reservationId == reservationId &&
        other.user == user &&
        listEquals(other.travelers, travelers) &&
        other.choosenTrip == choosenTrip;
  }

  @override
  int get hashCode {
    return reservationId.hashCode ^
        user.hashCode ^
        travelers.hashCode ^
        choosenTrip.hashCode;
  }
}
