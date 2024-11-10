import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/database_service.dart';
import '../../../../core/utils/date_format_utils.dart';
import '../../../reservation/data/models/trip_schedule_model.dart';
import '../../../trip/data/models/trip_model.dart';
import 'trips_list_repo.dart';

class TripsListRepoImpl implements TripsListRepo {
  final DatabaseService database;

  const TripsListRepoImpl({required this.database});
  @override
  Future<Either<List<TripModel>, Failure>> getTripsList({
    String searchTerm = '',
    String? betweenDepartureDate = '16/02/2024',
    String? andReturnDate = '18/03/2024',
    String? betweenReturnDate = '07/22/2024',
    String? andDepartureDate = '18/03/2024',
    String? lastId,
  }) async {
    try {
      List<String> queries = [
        Query.limit(AppConstants.pageSize),
        Query.orderDesc("\$createdAt")
      ];

      if (lastId != null) {
        queries.add(Query.cursorAfter(lastId));
      }

      // if (departureDate != null) {
      //   queries.add(Query.equal("returnDate", returnDate));
      // }

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
  Future<Either<List<TripModel>, Failure>> getFilteredTripsList({
    String? betweenDepartureDate,
    String? andReturnDate,
    String? betweenReturnDate,
    String? andDepartureDate,
    String? lastId,
    required int minPrice,
    required int maxPrice,
  }) async {
    try {
      log(DateFormat("yyyy-MM-ddTHH:mm:ss").format(DateTime.parse(
              DateFormatUtils.transformSlashesToTire(betweenDepartureDate!))
          .toUtc()));
      List<String> queries = [
        // Query.between("price", betweenDepartureDate, andDepartureDate),
        Query.between(
          "departureDate",
          DateFormat("yyyy-MM-ddTHH:mm:ss").format(DateTime.parse(
                  DateFormatUtils.transformSlashesToTire(betweenDepartureDate))
              .toUtc()),
          DateFormat("yyyy-MM-ddTHH:mm:ss").format(DateTime.parse(
                  DateFormatUtils.transformSlashesToTire(andDepartureDate!))
              .toUtc()),
        ),
        Query.between(
          "returnDate",
          DateFormat("yyyy-MM-ddTHH:mm:ss").format(DateTime.parse(
                  DateFormatUtils.transformSlashesToTire(betweenReturnDate!))
              .toUtc()),
          DateFormat("yyyy-MM-ddTHH:mm:ss").format(DateTime.parse(
                  DateFormatUtils.transformSlashesToTire(andReturnDate!))
              .toUtc()),
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
