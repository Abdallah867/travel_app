import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/trip_model.dart';
import '../../../data/repos/trip_repo.dart';

part 'trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  TripsCubit({required this.tripRepo}) : super(TripsInitial());
  final TripRepo tripRepo;
  List<TripModel> trips = [];

  Future<void> getTrips() async {
    emit(TripsLoadInProgess());
    final response = await tripRepo.getTrips();
    response.fold(
      (trips) {
        this.trips = trips;
        emit(TripsLoaded());
      },
      (failure) {
        log(failure.errMessage);
        emit(TripsFailure(errMessage: failure.errMessage));
      },
    );
  }
}
