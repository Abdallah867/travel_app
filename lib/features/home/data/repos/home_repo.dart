import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../trip/data/models/trip_model.dart';

abstract class HomeRepo {
  Future<Either<List<TripModel>, Failure>> getAgencies();
}
