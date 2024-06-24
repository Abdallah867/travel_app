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

  // void checkIsSaved(tripId) => isTripSaved = savedTripsIds.contains(tripId);
}
