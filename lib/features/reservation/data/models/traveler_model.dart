// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TravelerModel {
  final String travelerId;
  final String firstName;
  final String lastName;
  final String birthday;
  final String gender;
  TravelerModel({
    required this.travelerId,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.gender,
  });

  TravelerModel copyWith({
    String? travelerId,
    String? firstName,
    String? lastName,
    String? birthday,
    String? gender,
  }) {
    return TravelerModel(
      travelerId: travelerId ?? this.travelerId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'travelerId': travelerId,
      'firstName': firstName,
      'lastName': lastName,
      'birthday': birthday,
      'gender': gender,
    };
  }

  factory TravelerModel.fromMap(Map<String, dynamic> map) {
    return TravelerModel(
      travelerId: map['travelerId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      birthday: map['birthday'] as String,
      gender: map['gender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TravelerModel.fromJson(String source) =>
      TravelerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TravelerModel(travelerId: $travelerId, firstName: $firstName, lastName: $lastName, birthday: $birthday, gender: $gender)';
  }
}
