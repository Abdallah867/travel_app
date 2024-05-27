// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TripModel {
  final String tripId;
  final String image;
  final String location;
  final String description;
  final double price;
  final String duration;
  final String rating;
  final String agencyId;
  TripModel({
    required this.tripId,
    required this.image,
    required this.location,
    required this.description,
    required this.price,
    required this.duration,
    required this.rating,
    required this.agencyId,
  });

  TripModel copyWith({
    String? tripId,
    String? image,
    String? location,
    String? description,
    double? price,
    String? duration,
    String? rating,
    String? agencyId,
  }) {
    return TripModel(
      tripId: tripId ?? this.tripId,
      image: image ?? this.image,
      location: location ?? this.location,
      description: description ?? this.description,
      price: price ?? this.price,
      duration: duration ?? this.duration,
      rating: rating ?? this.rating,
      agencyId: agencyId ?? this.agencyId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tripId': tripId,
      'image': image,
      'location': location,
      'description': description,
      'price': price,
      'duration': duration,
      'rating': rating,
      'agencyId': agencyId,
    };
  }

  factory TripModel.fromMap(Map<String, dynamic> map) {
    return TripModel(
      tripId: map['tripId'] as String,
      image: map['image'] as String,
      location: map['location'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      duration: map['duration'] as String,
      rating: map['rating'] as String,
      agencyId: map['agencyId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TripModel.fromJson(String source) =>
      TripModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TripModel(tripId: $tripId, image: $image, location: $location, description: $description, price: $price, duration: $duration, rating: $rating, agencyId: $agencyId)';
  }

  @override
  bool operator ==(covariant TripModel other) {
    if (identical(this, other)) return true;

    return other.tripId == tripId &&
        other.image == image &&
        other.location == location &&
        other.description == description &&
        other.price == price &&
        other.duration == duration &&
        other.rating == rating &&
        other.agencyId == agencyId;
  }

  @override
  int get hashCode {
    return tripId.hashCode ^
        image.hashCode ^
        location.hashCode ^
        description.hashCode ^
        price.hashCode ^
        duration.hashCode ^
        rating.hashCode ^
        agencyId.hashCode;
  }
}
