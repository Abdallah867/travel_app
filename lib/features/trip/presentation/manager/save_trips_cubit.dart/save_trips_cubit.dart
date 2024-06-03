import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/trip_repo.dart';

part 'save_trips_state.dart';

class SaveTripsCubit extends Cubit<SaveTripsState> {
  final TripRepo tripRepo;
  SaveTripsCubit({required this.tripRepo}) : super(SaveTripsInitial());

  List<String> savedTripsIds = [];

  bool isTripSaved = false;

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
        emit(SaveTripsLoaded());
      },
      (r) {
        isTripSaved = !isTripSaved;
        emit(SaveTripsFailure());
      },
    );
  }
}
