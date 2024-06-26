import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/trip_model.dart';
import '../../../data/repos/trip_repo.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  TripCubit({required this.trip, required this.tripRepo})
      : super(TripLoadInProgress());
  final TripModel trip;
  final TripRepo tripRepo;
  bool isTripSaved = false;
  List<String>? savedTripsIds;

  void saveTrip({
    required String tripId,
    required String userId,
  }) {
    List<String> newSavedTrips = List.from(savedTripsIds!);
    newSavedTrips.add(tripId);
    checkIfTripSaved(newSavedTrips);
    updateTrip(userId: userId, savedTrips: newSavedTrips);
  }

  void unsaveTrip({
    required String tripId,
    required String userId,
  }) {
    List<String> newSavedTrips = List.from(savedTripsIds!);
    newSavedTrips.remove(tripId);
    checkIfTripSaved(newSavedTrips);
    updateTrip(userId: userId, savedTrips: newSavedTrips);
  }

  Future<void> updateTrip({
    required List<String> savedTrips,
    required String userId,
  }) async {
    emit(TripLoadInProgress());
    final savedTrip = await tripRepo.updateSavedTrips(
      savedTripsIds: savedTrips,
      userId: userId,
    );
    savedTrip.fold(
      (l) {
        savedTripsIds = savedTrips;
        emit(TripSuccess());
      },
      (failure) {
        checkIfTripSaved(savedTripsIds);
        emit(TripFailure(errMessage: failure.errMessage));
      },
    );
  }

  void checkIfTripSaved(savedTripsIds) {
    isTripSaved = savedTripsIds.contains(trip.tripId);
    emit(TripSaveChanged(isTripSaved));
  }
}
