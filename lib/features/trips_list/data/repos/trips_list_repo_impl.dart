import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/database_service.dart';
import '../../../trip/data/models/trip_model.dart';
import 'trips_list_repo.dart';

class TripsListRepoImpl implements TripsListRepo {
  final DatabaseService database;

  const TripsListRepoImpl({required this.database});
  @override
  Future<Either<List<TripModel>, Failure>> getTripsList({
    String searchTerm = '',
    int minPrice = AppConstants.minPrice,
    int maxPrice = AppConstants.maxPrice,
    String? departureDate,
    String? returnDate,
    String? lastId,
  }) async {
    try {
      List<String> queries = [
        Query.between("price", minPrice, maxPrice),
        Query.limit(AppConstants.pageSize),
        Query.orderDesc("\$createdAt")
      ];

      if (departureDate != null) {
        queries.add(Query.equal("departureDate", departureDate));
      }

      if (returnDate != null) {
        queries.add(Query.equal("returnDate", returnDate));
      }

      if (lastId != null) {
        queries.add(Query.cursorAfter(lastId));
      }

      if (departureDate != null) {
        queries.add(Query.equal("returnDate", returnDate));
      }

      final List<Document> response = await database.getList(
          endpoint: AppConstants.tripsCollectionEndpoint, queries: queries);

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
}
