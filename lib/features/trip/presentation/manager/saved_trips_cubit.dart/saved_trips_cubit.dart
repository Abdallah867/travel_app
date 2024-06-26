import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/trip_model.dart';
import '../../../data/repos/trip_repo.dart';

part 'saved_trips_state.dart';

class SavedTripsCubit extends Cubit<SavedTripsState> {
  SavedTripsCubit({required this.tripRepo}) : super(SavedTripsLoadInProgress());

  final TripRepo tripRepo;
  List<TripModel> savedTrips = [];

  List<String> savedTripsIds() {
    return savedTrips.map((trip) => trip.tripId).toList();
  }

  Future<void> getSavedTrips({required String userId}) async {
    emit(SavedTripsLoadInProgress());
    final response = await tripRepo.getSavedTrips(userId: userId);
    response.fold(
      (newSavedTrips) {
        savedTrips = newSavedTrips;
        emit(SavedTripsSuccess());
      },
      (failure) {
        emit(SavedTripsFailure(errMessage: failure.errMessage));
      },
    );
  }
}
