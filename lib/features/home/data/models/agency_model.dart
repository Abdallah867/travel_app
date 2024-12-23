import 'dart:convert';
import 'package:equatable/equatable.dart';

class AgencyModel extends Equatable {
  final String agencyId;
  final String agnecyName;
  final String agencyLogo;
  final String description;
  final String email;
  final List<String>? phoneNumbers;
  final String address;

  const AgencyModel({
    required this.agencyId,
    required this.agnecyName,
    required this.agencyLogo,
    required this.description,
    required this.email,
    required this.phoneNumbers,
    required this.address,
  });

  AgencyModel copyWith({
    String? agencyId,
    String? agnecyName,
    String? agencyLogo,
    String? description,
    String? email,
    List<String>? phoneNumbers,
    String? address,
  }) {
    return AgencyModel(
      agencyId: agencyId ?? this.agencyId,
      agnecyName: agnecyName ?? this.agnecyName,
      agencyLogo: agencyLogo ?? this.agencyLogo,
      description: description ?? this.description,
      email: email ?? this.email,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'agencyId': agencyId,
      'agencyName': agnecyName,
      'agencyLogo': agencyLogo,
      'description': description,
      'email': email,
      'phoneNumbers': phoneNumbers,
      'address': address,
    };
  }

  factory AgencyModel.fromMap(Map<String, dynamic> map) {
    return AgencyModel(
      agencyId: map['agencyId'] as String,
      agnecyName: map['agnecyName'] as String,
      agencyLogo: map['agencyLogo'] as String,
      description: map['description'] as String,
      email: map['email'] as String,
      phoneNumbers: map['phoneNumbers'] as List<String>?,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AgencyModel.fromJson(String source) =>
      AgencyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AgencyModel(agencyId: $agencyId, agnecyName: $agnecyName, agencyLogo: $agencyLogo, description: $description, email: $email, phoneNumbers: $phoneNumbers, address: $address)';
  }

  @override
  List<Object?> get props => [
        agencyId,
        agnecyName,
        agencyLogo,
        description,
        email,
        phoneNumbers,
        address,
      ];
}
