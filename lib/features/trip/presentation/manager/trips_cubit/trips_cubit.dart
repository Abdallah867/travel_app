import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/trip_model.dart';

part 'trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  TripsCubit() : super(TripsInitial());

  List<TripModel> trips = [];

  // Future<void> getTrips() {
  //   emit(TripsLoaded());
  //   return null;
  // }
}
