import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../home/data/models/agency_model.dart';

abstract class AgenciesRepo {
  Future<Either<List<AgencyModel>, Failure>> getAgencies({
    String searchTerm = '',
    String? lastId,
  });

  // Future<Either<List<AgencyModel>, Failure>> getFilteredAgenciesList({
  //   String? betweenDepartureDate,
  //   String? andReturnDate,
  //   String? betweenReturnDate,
  //   String? andDepartureDate,
  //   String? lastId,
  //   required int minPrice,
  //   required int maxPrice,
  // });

  Future<Either<void, Failure>> createTestAgenciesList();
}
