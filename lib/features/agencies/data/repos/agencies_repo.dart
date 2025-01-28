import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../home/data/models/agency_model.dart';

abstract class AgenciesRepo {
  Future<Either<List<AgencyModel>, Failure>> getAgencies({
    String searchTerm = '',
    String? lastId,
  });

  Future<Either<void, Failure>> createTestAgenciesList();
}
