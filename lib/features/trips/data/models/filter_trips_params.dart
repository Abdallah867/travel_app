// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/constants/app_constants.dart';

class FilterTripsParams {
  final String? betweenDepartureDate;
  final String? andReturnDate;
  final String? betweenReturnDate;
  final String? andDepartureDate;
  final int? minPrice;
  final int? maxPrice;

  FilterTripsParams({
    this.betweenDepartureDate,
    this.andReturnDate,
    this.betweenReturnDate,
    this.andDepartureDate,
    this.minPrice = AppConstants.minPrice,
    this.maxPrice = AppConstants.maxPrice,
  });

  FilterTripsParams copyWith({
    String? betweenDepartureDate,
    String? andReturnDate,
    String? betweenReturnDate,
    String? andDepartureDate,
    int? minPrice,
    int? maxPrice,
  }) {
    return FilterTripsParams(
      betweenDepartureDate: betweenDepartureDate ?? this.betweenDepartureDate,
      andReturnDate: andReturnDate ?? this.andReturnDate,
      betweenReturnDate: betweenReturnDate ?? this.betweenReturnDate,
      andDepartureDate: andDepartureDate ?? this.andDepartureDate,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
    );
  }
}
