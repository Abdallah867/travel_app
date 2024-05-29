import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:travel_app/core/networking/database_service.dart';
import 'package:travel_app/features/home/data/models/trip_model.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failure.dart';
import 'home_repo.dart';

abstract class HomeRepoImpl implements HomeRepo {
  final DatabaseService database;

  HomeRepoImpl({required this.database});
  @override
  Future<Either<List<TripModel>, Failure>> getTrips() async {
    try {
      final List<Document> response = await database.getList(
        endpoint: AppConstants.profilesCollectionEndpoint,
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
}
