import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/trip_model.dart';
import '../../../data/repos/trip_repo.dart';

part 'saved_trips_state.dart';

class SavedTripsCubit extends Cubit<SavedTripsState> {
  SavedTripsCubit({required this.tripRepo}) : super(SavedTripsLoadInProgress());

  final TripRepo tripRepo;
  List<TripModel> savedTrips = [];
  List<String> savedTripsIds = [];
  bool isSaved(tripId) => savedTripsIds.contains(tripId);

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

  Future<void> getSavedTripsIds({required String userId}) async {
    emit(SavedTripsLoadInProgress());
    final response = await tripRepo.getSavedTrips(userId: userId);
    response.fold(
      (savedTrips) {
        savedTripsIds = savedTrips.map((trip) => trip.tripId).toList();
        emit(SavedTripsSuccess());
      },
      (failure) {
        emit(SavedTripsFailure(errMessage: failure.errMessage));
      },
    );
  }

  void saveTrip({required String tripId, required String userId}) {
    final newSavedTrips = List<String>.from(savedTripsIds);
    newSavedTrips.add(tripId);
    updateTrip(userId: userId, savedTrips: newSavedTrips);
  }

  void unsaveTrip({required String tripId, required String userId}) {
    final newSavedTrips = List<String>.from(savedTripsIds);
    newSavedTrips.remove(tripId);
    updateTrip(userId: userId, savedTrips: newSavedTrips);
  }

  Future<void> updateTrip({
    required List<String> savedTrips,
    required String userId,
  }) async {
    emit(SavedTripsLoadInProgress());
    final savedTrip = await tripRepo.updateSavedTrips(
      savedTripsIds: savedTrips,
      userId: userId,
    );
    savedTrip.fold(
      (l) {
        emit(SavedTripsSuccess());
      },
      (failure) {
        emit(SavedTripsFailure(errMessage: failure.errMessage));
      },
    );
  }
}
