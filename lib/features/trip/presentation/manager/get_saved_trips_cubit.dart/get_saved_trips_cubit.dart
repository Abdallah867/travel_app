import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/trip_model.dart';
import '../../../data/repos/trip_repo.dart';

part 'get_saved_trips_state.dart';

class GetSavedTripsCubit extends Cubit<GetSavedTripsState> {
  GetSavedTripsCubit({required this.tripRepo}) : super(GetSavedTripsInitial());

  final TripRepo tripRepo;
  List<TripModel> savedTrips = [];

  Future<void> getSavedTrips({required String userId}) async {
    emit(GetSavedTripsLoadInProgress());
    final response = await tripRepo.getSavedTrips(userId: userId);
    response.fold(
      (newSavedTrips) {
        savedTrips = newSavedTrips;
        emit(GetSavedTripsSuccess());
      },
      (failure) {
        emit(GetSavedTripsFailure(errMessage: failure.errMessage));
      },
    );
  }
}
