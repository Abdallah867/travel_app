import 'package:appwrite/appwrite.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../home/data/models/agency_model.dart';
import '../../../../../trip/data/models/trip_model.dart';
import '../../../../../trips/data/repos/trips_list_repo.dart';

part 'agency_details_state.dart';

class AgencyDetailsCubit extends Cubit<AgencyDetailsState> {
  final AgencyModel agency;
  final TripsListRepo tripsRepo;
  AgencyDetailsCubit(this.agency, this.tripsRepo)
      : super(AgencyDetailsInitial());

  Future<void> getAgencyTrips(String? lastId) async {
    emit(AgencyDetailsTripsLoding());

    final response = await tripsRepo.getTripsList(
        filters: [Query.equal('agencyId', agency.agencyId)], lastId: lastId);

    response.fold(
      (trips) {
        emit(AgencyDetailsTripsLoaded(trips: trips));
      },
      (failure) {
        emit(AgencyDetailsTripsFailure(errMessage: failure.errMessage));
      },
    );
  }
}
