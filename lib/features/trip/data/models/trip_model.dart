import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../home/data/models/agency_model.dart';

class TripModel {
  final String tripId;
  final String title;
  final String coverImage;
  final String location;
  final String description;
  final int price;
  final int duration;
  final double rating;
  final List<String> otherImages;
  final AgencyModel agency;

  TripModel({
    required this.tripId,
    required this.title,
    required this.coverImage,
    required this.location,
    required this.description,
    required this.price,
    required this.duration,
    required this.rating,
    required this.otherImages,
    required this.agency,
  });

  TripModel copyWith({
    String? tripId,
    String? title,
    String? coverImage,
    String? location,
    String? description,
    int? price,
    int? duration,
    double? rating,
    List<String>? otherImages,
    AgencyModel? agency,
  }) {
    return TripModel(
      tripId: tripId ?? this.tripId,
      title: title ?? this.title,
      coverImage: coverImage ?? this.coverImage,
      location: location ?? this.location,
      description: description ?? this.description,
      price: price ?? this.price,
      duration: duration ?? this.duration,
      rating: rating ?? this.rating,
      otherImages: otherImages ?? this.otherImages,
      agency: agency ?? this.agency,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tripId': tripId,
      'title': title,
      'coverImage': coverImage,
      'location': location,
      'description': description,
      'price': price,
      'duration': duration,
      'rating': rating,
      'otherImages': otherImages,
      'agency': agency.toMap(),
    };
  }

  factory TripModel.fromMap(Map<String, dynamic> map) {
    return TripModel(
      tripId: map['tripId'] as String,
      title: map['title'] as String,
      coverImage: map['coverImage'] as String,
      location: map['location'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
      duration: map['duration'] as int,
      rating: map['rating'] as double,
      otherImages: List<String>.from(
        (map['otherImages'] as List<dynamic>),
      ),
      agency: AgencyModel.fromMap(map['agency'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TripModel.fromJson(String source) =>
      TripModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TripModel(tripId: $tripId, title: $title, coverImage: $coverImage, location: $location, description: $description, price: $price, duration: $duration, rating: $rating, otherImages: $otherImages, agency: $agency)';
  }

  @override
  bool operator ==(covariant TripModel other) {
    if (identical(this, other)) return true;

    return other.tripId == tripId &&
        other.title == title &&
        other.coverImage == coverImage &&
        other.location == location &&
        other.description == description &&
        other.price == price &&
        other.duration == duration &&
        other.rating == rating &&
        listEquals(other.otherImages, otherImages) &&
        other.agency == agency;
  }

  @override
  int get hashCode {
    return tripId.hashCode ^
        title.hashCode ^
        coverImage.hashCode ^
        location.hashCode ^
        description.hashCode ^
        price.hashCode ^
        duration.hashCode ^
        rating.hashCode ^
        otherImages.hashCode ^
        agency.hashCode;
  }
}
