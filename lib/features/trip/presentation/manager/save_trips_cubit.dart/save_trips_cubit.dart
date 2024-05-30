import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/trip_repo.dart';

part 'save_trips_state.dart';

class SaveTripsCubit extends Cubit<SaveTripsState> {
  final TripRepo tripRepo;
  SaveTripsCubit({required this.tripRepo}) : super(SaveTripsInitial());

  List<String> savedTripsIds = [];

  bool isTripSaved = false;

  saveTrip({required tripId}) {
    final newSavedTrips = List<String>.from(savedTripsIds);
    newSavedTrips.add(tripId);
    updateTrip(newSavedTrips);
  }

  unsaveTrip({required tripId}) {
    final newSavedTrips = List<String>.from(savedTripsIds);
    newSavedTrips.remove(tripId);
    updateTrip(newSavedTrips);
  }

  Future<void> updateTrip(List<String> savedTrips) async {
    try {
      isTripSaved = !isTripSaved;
      await tripRepo.updateSavedTrips(
        savedTripsIds: savedTrips,
        userId: '123',
      );
    } on Exception catch (e) {
      isTripSaved = !isTripSaved;
    }
  }
}
