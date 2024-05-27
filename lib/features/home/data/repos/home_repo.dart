import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/trip_model.dart';

abstract class HomeRepo {
  Future<Either<List<TripModel>, Failure>> getTrips();
  Future<Either<List<TripModel>, Failure>> getAgencies();
}
