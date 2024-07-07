import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

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
  Future<Either<void, Failure>> saveReservation({
    required ReservationModel reservation,
    required List<TravelerModel> travelers,
  }) async {
    try {
      await databaseService.create(
        data: reservation.toMap(),
        endpoint: AppConstants.reservationsCollectionEndpoint,
        id: UniqueKey().toString(),
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
          id: UniqueKey().toString(),
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

  @override
  Future<Either<List<TripScheduleModel>, Failure>> getTripSchedule(
      String tripId) async {
    try {
      final response = await databaseService.get(
          endpoint: AppConstants.tripsCollectionEndpoint, id: tripId);

      print(response);

      List jsonTripSchedule = response['tripSchedule'] ?? [];

      List<TripScheduleModel> tripSchedule = jsonTripSchedule
          .map((trip) => TripScheduleModel.fromMap(trip))
          .toList();

      return left(tripSchedule);
    } on AppwriteException catch (e) {
      return right(
        Failure(errMessage: e.message ?? 'Some unexpected error occurred'),
      );
    } catch (e) {
      print(e);
      return right(
        Failure(errMessage: e.toString()),
      );
    }
  }
}
