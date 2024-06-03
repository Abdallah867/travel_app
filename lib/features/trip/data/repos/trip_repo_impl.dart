import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/networking/database_service.dart';
import '../models/trip_model.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failure.dart';
import 'trip_repo.dart';

class TripRepoImpl implements TripRepo {
  final DatabaseService database;

  const TripRepoImpl({required this.database});
  @override
  Future<Either<List<TripModel>, Failure>> getTrips() async {
    try {
      final List<Document> response = await database.getList(
        endpoint: AppConstants.tripsCollectionEndpoint,
      );

      final tripsList =
          response.map((trip) => TripModel.fromMap(trip.data)).toList();
      return left(tripsList);
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
  Future<Either<void, Failure>> updateSavedTrips({
    required String userId,
    required List<String> savedTripsIds,
  }) async {
    try {
      log('$savedTripsIds');
      await database.update(
        id: userId,
        endpoint: AppConstants.savesCollectionEndpoint,
        data: {
          'trips': savedTripsIds,
        },
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
  Future<Either<List<TripModel>, Failure>> getSavedTrips(
      {required String userId}) async {
    try {
      final response = await database.get(
        id: userId,
        endpoint: AppConstants.savesCollectionEndpoint,
      );

      List jsonTrips = response['trips'] ?? [];
      List<TripModel> trips =
          jsonTrips.map((trip) => TripModel.fromMap(trip)).toList();

      return left(trips);
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
