import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/trip_model.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  TripCubit({required this.trip}) : super(TripInProgess());
  final TripModel trip;
}
