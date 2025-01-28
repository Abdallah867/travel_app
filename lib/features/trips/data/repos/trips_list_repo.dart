import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../trip/data/models/trip_model.dart';
import '../models/filter_trips_params.dart';

abstract class TripsListRepo {
  Future<Either<List<TripModel>, Failure>> getTripsList({
    String searchTerm = '',
    String? lastId,
    List<String>? filters,
  });

  Future<Either<List<TripModel>, Failure>> getFilteredTripsListFromTripSchedule(
      {required FilterTripsParams filterTripsParams, String lastId});

  Future<Either<void, Failure>> createTestTripsList();
}
