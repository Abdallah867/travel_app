import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/trip_repo.dart';

part 'save_trips_state.dart';

class SaveTripsCubit extends Cubit<SaveTripsState> {
  final TripRepo tripRepo;
  SaveTripsCubit({required this.tripRepo}) : super(SaveTripsInitial());

  List<String> savedTripsIds = [];

  bool isTripSaved = false;

  Future<void> getSavedTripsIds({required String userId}) async {
    emit(SaveTripsLoadInProgress());
    final response = await tripRepo.getSavedTrips(userId: userId);
    response.fold(
      (savedTrips) {
        savedTripsIds = savedTrips.map((trip) => trip.tripId).toList();
        emit(SaveTripsSuccess());
      },
      (failure) {
        log(failure.errMessage);
        emit(SaveTripsFailure(errMessage: failure.errMessage));
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
    emit(SaveTripsLoadInProgress());
    final savedTrip = await tripRepo.updateSavedTrips(
      savedTripsIds: savedTrips,
      userId: userId,
    );
    savedTrip.fold(
      (l) {
        emit(SaveTripsSuccess());
      },
      (failure) {
        isTripSaved = !isTripSaved;
        emit(SaveTripsFailure(errMessage: failure.errMessage));
      },
    );
  }
}
