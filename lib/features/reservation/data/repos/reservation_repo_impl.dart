import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/database_service.dart';
import '../models/reservation_model.dart';
import '../models/traveler_model.dart';
import '../models/trip_schedule_model.dart';
import 'reservation_repo.dart';

class ReservationRepoImpl implements ReservationRepo {
  final DatabaseService databaseService;

  ReservationRepoImpl({required this.databaseService});

  @override
  Future<Either<List<ReservationModel>, Failure>> getReservations(
      String userId) async {
    try {
      final response = await databaseService.getList(queries: [
        Query.equal('userId', userId),
      ], endpoint: AppConstants.reservationsCollectionEndpoint);

      print(response);

      List<ReservationModel> reservations =
          response.map((e) => ReservationModel.fromMap(e.data)).toList();
      print(reservations);

      return left(reservations);
    } on AppwriteException catch (e) {
      return right(
          Failure(errMessage: e.message ?? 'Some unexpected error occurred'));
    } catch (e) {
      return right(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<void, Failure>> saveReservation({
    required ReservationModel reservation,
    required List<TravelerModel> travelers,
  }) async {
    try {
      await databaseService.create(
        data: reservation.copyWith(reservationId: ID.unique()).toMap(),
        endpoint: AppConstants.reservationsCollectionEndpoint,
        id: ID.unique(),
      );

      await addTravelers(travelers);

      return left(null);
    } on AppwriteException catch (e) {
      return right(
        Failure(errMessage: e.message ?? 'Some unexpected error occurred'),
      );
    } catch (e) {
      return right(
        Failure(errMessage: e.toString()),
      );
    }
  }

  @override
  Future<Either<void, Failure>> addTravelers(
      List<TravelerModel> travelers) async {
    try {
      for (var traveler in travelers) {
        await databaseService.create(
          data: traveler.toMap(),
          endpoint: AppConstants.travelersCollectionEndpoint,
          id: traveler.travelerId,
        );
      }
      return left(null);
    } on AppwriteException catch (e) {
      return right(
        Failure(errMessage: e.message ?? 'Some unexpected error occurred'),
      );
    } catch (e) {
      return right(
        Failure(errMessage: e.toString()),
      );
    }
  }

  Future<Either<TravelerModel, Failure>> updateTraveler(
      TravelerModel traveler) async {
    try {
      final updatedTraveler = await databaseService.update(
        data: traveler.toMap(),
        endpoint: AppConstants.travelersCollectionEndpoint,
        id: traveler.travelerId,
      );
      return left(TravelerModel.fromMap(updatedTraveler));
    } on AppwriteException catch (e) {
      return right(
        Failure(errMessage: e.message ?? 'Some unexpected error occurred'),
      );
    } catch (e) {
      return right(
        Failure(errMessage: e.toString()),
      );
    }
  }

  @override
  Future<Either<List<TripScheduleModel>, Failure>> getTripSchedule(
      String tripId) async {
    try {
      final response = await databaseService.getList(
          endpoint: AppConstants.tripScheduleCollectionEndpoint,
          queries: [
            Query.equal('tripId', tripId),
          ]);

      List<TripScheduleModel> tripSchedule =
          response.map((trip) => TripScheduleModel.fromMap(trip.data)).toList();

      return left(tripSchedule);
    } on AppwriteException catch (e) {
      return right(
        Failure(errMessage: e.message ?? 'Some unexpected error occurred'),
      );
    } catch (e) {
      return right(
        Failure(errMessage: e.toString()),
      );
    }
  }
}
