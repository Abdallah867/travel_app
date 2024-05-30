// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AgencyModel {
  final String agencyId;
  final String agnecyName;
  final String agencyLogo;
  final String description;
  final String email;
  final String phoneNumber;
  final String address;
  AgencyModel({
    required this.agencyId,
    required this.agnecyName,
    required this.agencyLogo,
    required this.description,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  AgencyModel copyWith({
    String? agencyId,
    String? agnecyName,
    String? agencyLogo,
    String? description,
    String? email,
    String? phoneNumber,
    String? address,
  }) {
    return AgencyModel(
      agencyId: agencyId ?? this.agencyId,
      agnecyName: agnecyName ?? this.agnecyName,
      agencyLogo: agencyLogo ?? this.agencyLogo,
      description: description ?? this.description,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'agencyId': agencyId,
      'agnecyName': agnecyName,
      'agencyLogo': agencyLogo,
      'description': description,
      'email': email,
      'phoneNumber': phoneNumber,
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
      phoneNumber: map['phoneNumber'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AgencyModel.fromJson(String source) =>
      AgencyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AgencyModel(agencyId: $agencyId, agnecyName: $agnecyName, agencyLogo: $agencyLogo, description: $description, email: $email, phoneNumber: $phoneNumber, address: $address)';
  }

  @override
  bool operator ==(covariant AgencyModel other) {
    if (identical(this, other)) return true;

    return other.agencyId == agencyId &&
        other.agnecyName == agnecyName &&
        other.agencyLogo == agencyLogo &&
        other.description == description &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.address == address;
  }

  @override
  int get hashCode {
    return agencyId.hashCode ^
        agnecyName.hashCode ^
        agencyLogo.hashCode ^
        description.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        address.hashCode;
  }
}
