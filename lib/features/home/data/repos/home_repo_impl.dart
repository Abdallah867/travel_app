import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import 'home_repo.dart';
import '../../../trip/data/models/trip_model.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<List<TripModel>, Failure>> getAgencies() {
    // TODO: implement getAgencies
    throw UnimplementedError();
  }
}
