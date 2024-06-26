import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/trip_model.dart';

abstract class TripRepo {
  Future<Either<List<TripModel>, Failure>> getTrips();
  Future<Either<void, Failure>> updateSavedTrips({
    required String userId,
    required List<String> savedTripsIds,
  });

  Future<Either<List<TripModel>, Failure>> getSavedTrips({
    required String userId,
  });
}
