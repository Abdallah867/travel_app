// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TravelerModel {
  final String travelerId;
  final String nationalId;
  final String firstName;
  final String lastName;
  final int age;
  final String gender;
  TravelerModel({
    required this.travelerId,
    required this.nationalId,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
  });

  TravelerModel copyWith({
    String? travelerId,
    String? nationalId,
    String? firstName,
    String? lastName,
    int? age,
    String? gender,
  }) {
    return TravelerModel(
      travelerId: travelerId ?? this.travelerId,
      nationalId: nationalId ?? this.nationalId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'travelerId': travelerId,
      'nationalId': nationalId,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'gender': gender,
    };
  }

  factory TravelerModel.fromMap(Map<String, dynamic> map) {
    return TravelerModel(
      travelerId: map['travelerId'] as String,
      nationalId: map['nationalId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      age: map['age'] as int,
      gender: map['gender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TravelerModel.fromJson(String source) =>
      TravelerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TravelerModel(travelerId: $travelerId, nationalId: $nationalId, firstName: $firstName, lastName: $lastName, age: $age, gender: $gender)';
  }
}
