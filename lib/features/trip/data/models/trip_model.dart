// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../home/data/models/agency_model.dart';

class TripModel {
  final String tripId;
  final String title;
  final String image;
  final String location;
  final String description;
  final int price;
  final int duration;
  final double rating;
  final AgencyModel? agency;
  TripModel({
    required this.tripId,
    required this.title,
    required this.image,
    required this.location,
    required this.description,
    required this.price,
    required this.duration,
    required this.rating,
    this.agency,
  });

  TripModel copyWith({
    String? tripId,
    String? title,
    String? image,
    String? location,
    String? description,
    int? price,
    int? duration,
    double? rating,
    AgencyModel? agency,
  }) {
    return TripModel(
      tripId: tripId ?? this.tripId,
      title: title ?? this.title,
      image: image ?? this.image,
      location: location ?? this.location,
      description: description ?? this.description,
      price: price ?? this.price,
      duration: duration ?? this.duration,
      rating: rating ?? this.rating,
      agency: agency ?? this.agency,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tripId': tripId,
      'title': title,
      'image': image,
      'location': location,
      'description': description,
      'price': price,
      'duration': duration,
      'rating': rating,
      'agency': agency?.toMap(),
    };
  }

  factory TripModel.fromMap(Map<String, dynamic> map) {
    return TripModel(
      tripId: map['tripId'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
      location: map['location'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
      duration: map['duration'] as int,
      rating: map['rating'] as double,
      agency: map['agency'] != null
          ? AgencyModel.fromMap(map['agency'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TripModel.fromJson(String source) =>
      TripModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TripModel(tripId: $tripId, title: $title, image: $image, location: $location, description: $description, price: $price, duration: $duration, rating: $rating, agency: $agency)';
  }

  @override
  bool operator ==(covariant TripModel other) {
    if (identical(this, other)) return true;

    return other.tripId == tripId &&
        other.title == title &&
        other.image == image &&
        other.location == location &&
        other.description == description &&
        other.price == price &&
        other.duration == duration &&
        other.rating == rating &&
        other.agency == agency;
  }

  @override
  int get hashCode {
    return tripId.hashCode ^
        title.hashCode ^
        image.hashCode ^
        location.hashCode ^
        description.hashCode ^
        price.hashCode ^
        duration.hashCode ^
        rating.hashCode ^
        agency.hashCode;
  }
}
