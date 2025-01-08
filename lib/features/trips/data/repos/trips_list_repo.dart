import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../trip/data/models/trip_model.dart';

abstract class TripsListRepo {
  Future<Either<List<TripModel>, Failure>> getTripsList({
    String searchTerm = '',
    String? lastId,
    List<String>? filters,
  });

  Future<Either<List<TripModel>, Failure>>
      getFilteredTripsListFromTripSchedule({
    String? betweenDepartureDate,
    String? andReturnDate,
    String? betweenReturnDate,
    String? andDepartureDate,
    String? lastId,
    required int minPrice,
    required int maxPrice,
  });

  Future<Either<void, Failure>> createTestTripsList();
}
