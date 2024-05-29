import 'package:dartz/dartz.dart';
import 'package:travel_app/core/errors/failure.dart';
import 'package:travel_app/features/home/data/repos/home_repo.dart';
import 'package:travel_app/features/trip/data/models/trip_model.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<List<TripModel>, Failure>> getAgencies() {
    // TODO: implement getAgencies
    throw UnimplementedError();
  }
}
