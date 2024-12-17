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
      String userId, String statusFilter) async {
    try {
      List<String> queries = [
        Query.equal('userId', userId),
      ];
      queries.add(Query.equal('status', statusFilter));
      final response = await databaseService.getList(
        queries: queries,
        endpoint: AppConstants.reservationsCollectionEndpoint,
      );

      List<ReservationModel> reservations =
          response.map((e) => ReservationModel.fromMap(e.data)).toList();

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
        data: reservation.toMap(),
        endpoint: AppConstants.reservationsCollectionEndpoint,
        id: ID.custom(reservation.reservationId),
      );

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
  Future<Either<void, Failure>> updateReservation({
    required ReservationModel updatedReservation,
  }) async {
    try {
      await databaseService.update(
        data: updatedReservation.toMap(),
        endpoint: AppConstants.reservationsCollectionEndpoint,
        id: updatedReservation.reservationId,
      );

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
  Future<Either<void, Failure>> addTraveler(TravelerModel traveler) async {
    try {
      await databaseService.create(
        data: traveler.toMap(),
        endpoint: AppConstants.travelersCollectionEndpoint,
        id: traveler.travelerId,
      );
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
