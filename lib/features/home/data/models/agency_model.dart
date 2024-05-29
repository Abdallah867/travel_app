// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AgencyModel {
  final String agencyId;
  final String agnecyName;
  final String profilePicture;
  final String description;
  final String email;
  final String phoneNumber;
  final String address;
  AgencyModel({
    required this.agencyId,
    required this.agnecyName,
    required this.profilePicture,
    required this.description,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  AgencyModel copyWith({
    String? agencyId,
    String? agnecyName,
    String? profilePicture,
    String? description,
    String? email,
    String? phoneNumber,
    String? address,
  }) {
    return AgencyModel(
      agencyId: agencyId ?? this.agencyId,
      agnecyName: agnecyName ?? this.agnecyName,
      profilePicture: profilePicture ?? this.profilePicture,
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
      'profilePicture': profilePicture,
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
      profilePicture: map['profilePicture'] as String,
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
    return 'AgencyModel(agencyId: $agencyId, agnecyName: $agnecyName, profilePicture: $profilePicture, description: $description, email: $email, phoneNumber: $phoneNumber, address: $address)';
  }

  @override
  bool operator ==(covariant AgencyModel other) {
    if (identical(this, other)) return true;

    return other.agencyId == agencyId &&
        other.agnecyName == agnecyName &&
        other.profilePicture == profilePicture &&
        other.description == description &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.address == address;
  }

  @override
  int get hashCode {
    return agencyId.hashCode ^
        agnecyName.hashCode ^
        profilePicture.hashCode ^
        description.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        address.hashCode;
  }
}
