import 'package:dartz/dartz.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failure.dart';
import '../../../trip/data/models/trip_model.dart';

abstract class TripsListRepo {
  Future<Either<List<TripModel>, Failure>> getTripsList({
    String searchTerm = '',
    int minPrice = AppConstants.minPrice,
    int maxPrice = AppConstants.maxPrice,
    String? departureDate,
    String? returnDate,
    String? lastId,
  });

  Future<Either<void, Failure>> createTestTripsList();
}
