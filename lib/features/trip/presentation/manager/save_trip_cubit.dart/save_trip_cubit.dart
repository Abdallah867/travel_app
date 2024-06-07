import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/trip_repo.dart';

part 'save_trip_state.dart';

class SaveTripCubit extends Cubit<SaveTripState> {
  final TripRepo tripRepo;
  SaveTripCubit({required this.tripRepo}) : super(SaveTripInitial());

  List<String> savedTripsIds = [];

  bool isTripSaved = false;

  Future<void> getSavedTripsIds({required String userId}) async {
    emit(SaveTripLoadInProgress());
    final response = await tripRepo.getSavedTrips(userId: userId);
    response.fold(
      (savedTrips) {
        savedTripsIds = savedTrips.map((trip) => trip.tripId).toList();
        emit(SaveTripSuccess());
      },
      (failure) {
        log(failure.errMessage);
        emit(SaveTripFailure(errMessage: failure.errMessage));
      },
    );
  }

  // void checkIsSaved(tripId) => isTripSaved = savedTripsIds.contains(tripId);
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
    isTripSaved = !isTripSaved;
    emit(SaveTripLoadInProgress());
    final savedTrip = await tripRepo.updateSavedTrips(
      savedTripsIds: savedTrips,
      userId: userId,
    );
    savedTrip.fold(
      (l) {
        emit(SaveTripSuccess());
      },
      (failure) {
        isTripSaved = !isTripSaved;
        emit(SaveTripFailure(errMessage: failure.errMessage));
      },
    );
  }
}
