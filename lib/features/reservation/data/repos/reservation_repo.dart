import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/reservation_model.dart';
import '../models/traveler_model.dart';
import '../models/trip_schedule_model.dart';

abstract class ReservationRepo {
  Future<Either<void, Failure>> saveReservation({
    required ReservationModel reservation,
    required List<TravelerModel> travelers,
  });
  Future<Either<List<TripScheduleModel>, Failure>> getTripSchedule(
      String tripId);
  Future<Either<void, Failure>> addTraveler(TravelerModel traveler);

  Future<Either<List<ReservationModel>, Failure>> getReservations(
    String userId,
  );
  Future<Either<TravelerModel, Failure>> updateTraveler(TravelerModel traveler);

  Future<Either<void, Failure>> updateReservation(
      {required ReservationModel updatedReservation});
}
