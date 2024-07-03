import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/reservation_model.dart';
import '../models/traveler_model.dart';

abstract class BookingRepo {
  Future<Either<void, Failure>> saveReservation(
    ReservationModel reservation,
    List<TravelerModel> travelers,
  );
  Future<Either<void, Failure>> addTravelers(List<TravelerModel> travelers);
}
