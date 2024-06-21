import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel extends Equatable {
  final String userId;
  final String username;
  final String email;
  final String? profilePicture;
  final String? phoneNumber;
  const UserModel({
    required this.userId,
    required this.username,
    required this.email,
    this.profilePicture,
    this.phoneNumber,
  });

  UserModel copyWith({
    String? userId,
    String? username,
    String? email,
    String? profilePicture,
    String? phoneNumber,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object> get props => [
        username,
        email,
        phoneNumber ?? '',
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'username': username,
      'email': email,
      'profilePicture': profilePicture,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      profilePicture: map['profilePicture'] != null
          ? map['profilePicture'] as String
          : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(userId: $userId, username: $username, email: $email, profilePicture: $profilePicture, phoneNumber: $phoneNumber)';
  }
}
