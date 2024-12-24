import 'dart:convert';

import 'package:equatable/equatable.dart';

class AgencyModel extends Equatable {
  final String agencyId;
  final String agnecyName;
  final String? agencyLogo; // Assuming agencyLogo can be null
  final String description;
  final String email;
  final List<String>? phoneNumbers;
  final String address;
  final double? rating; // Assuming rating can be null

  const AgencyModel({
    required this.agencyId,
    required this.agnecyName,
    this.agencyLogo,
    required this.description,
    required this.email,
    this.phoneNumbers,
    required this.address,
    this.rating,
  });

  AgencyModel copyWith({
    String? agencyId,
    String? agnecyName,
    String? agencyLogo,
    String? description,
    String? email,
    List<String>? phoneNumbers,
    String? address,
    double? rating,
  }) {
    return AgencyModel(
      agencyId: agencyId ?? this.agencyId,
      agnecyName: agnecyName ?? this.agnecyName,
      agencyLogo: agencyLogo ?? this.agencyLogo,
      description: description ?? this.description,
      email: email ?? this.email,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
      address: address ?? this.address,
      rating: rating ?? this.rating,
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
      'rating': rating,
    };
  }

  factory AgencyModel.fromMap(Map<String, dynamic> map) {
    return AgencyModel(
      agencyId: map['agencyId'] as String,
      agnecyName: map['agencyName'] as String,
      agencyLogo: map['agencyLogo'] as String?, // Handling null safely
      description: map['description'] as String,
      email: map['email'] as String,
      phoneNumbers: map['phoneNumbers'] != null
          ? List<String>.from(map['phoneNumbers'] as List)
          : null, // Ensure we handle null values for phoneNumbers
      address: map['address'] as String,
      rating: map['rating'] != null
          ? map['rating'].toDouble() as double
          : null, // Handle null for rating
    );
  }

  String toJson() => json.encode(toMap());

  factory AgencyModel.fromJson(String source) =>
      AgencyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AgencyModel(agencyId: $agencyId, agnecyName: $agnecyName, agencyLogo: $agencyLogo, description: $description, email: $email, phoneNumbers: $phoneNumbers, address: $address, rating: $rating)';
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
        rating,
      ];
}
