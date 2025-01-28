import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/database_service.dart';
import '../../../../core/utils/date_format_utils.dart';
import '../../../reservation/data/models/trip_schedule_model.dart';
import '../../../trip/data/models/trip_model.dart';
import '../models/filter_trips_params.dart';
import 'trips_list_repo.dart';

class TripsListRepoImpl implements TripsListRepo {
  final DatabaseService database;

  const TripsListRepoImpl({required this.database});
  @override
  Future<Either<List<TripModel>, Failure>> getTripsList({
    String searchTerm = '',
    String? lastId,
    List<String>? filters,
  }) async {
    try {
      List<String> queries = [
        Query.limit(AppConstants.pageSize),
        Query.orderDesc("\$createdAt")
      ];

      if (lastId != null) {
        queries.add(Query.cursorAfter(lastId));
      }

      if (filters != null) {
        queries.addAll(filters);
      }
      if (searchTerm.isNotEmpty) {
        queries.add(Query.search("title", searchTerm));
        queries.add(Query.search("description", searchTerm));
      }

      final List<Document> response = await database.getList(
          endpoint: AppConstants.tripsCollectionEndpoint, queries: queries);

      List<TripModel> tripsList =
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
  Future<Either<void, Failure>> createTestTripsList() async {
    try {
      final Map<String, dynamic> data = {
        'title': 'Trip 1',
        'price': 100000,
        'rating': 4.5,
        'tripId': '123',
        'location': 'Skikda',
        'duration': 7,
        'image': 'https://example.com/images/skikda_trip3.jpg',
        'description':
            'Experience the serene beauty of Skikda with Sea Breeze Travels. Over four days, ',
      };

      for (int i = 0; i < 20; i++) {
        await database.create(
          data: data,
          endpoint: AppConstants.tripsCollectionEndpoint,
          id: ID.unique(),
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
  Future<Either<List<TripModel>, Failure>>
      getFilteredTripsListFromTripSchedule({
    required FilterTripsParams filterTripsParams,
    String? lastId,
  }) async {
    try {
      List<String> queries = [
        Query.between(
            "price", filterTripsParams.minPrice, filterTripsParams.maxPrice),
        Query.between(
          "departureDate",
          DateFormatUtils.formatDateToIso8601(
            filterTripsParams.betweenDepartureDate!,
          ),
          DateFormatUtils.formatDateToIso8601(
              filterTripsParams.andDepartureDate!),
        ),
        Query.between(
          "returnDate",
          DateFormatUtils.formatDateToIso8601(
              filterTripsParams.betweenReturnDate!),
          DateFormatUtils.formatDateToIso8601(filterTripsParams.andReturnDate!),
        ),
        Query.limit(AppConstants.pageSize),
        Query.orderDesc("\$createdAt")
      ];

      if (lastId != null) {
        queries.add(Query.cursorAfter(lastId));
      }

      final List<Document> response = await database.getList(
        endpoint: AppConstants.tripScheduleCollectionEndpoint,
        queries: queries,
      );

      List<TripScheduleModel> tripsScheduleList = response
          .map((tripSchedule) => TripScheduleModel.fromMap(tripSchedule.data))
          .toList();

      Set<TripModel> trips =
          tripsScheduleList.map((tripSchedule) => tripSchedule.trip).toSet();

      log('${trips.length}');
      return left(trips.toList());
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
