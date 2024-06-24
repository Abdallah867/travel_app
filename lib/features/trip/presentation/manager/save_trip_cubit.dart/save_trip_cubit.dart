import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/trip_repo.dart';

part 'save_trip_state.dart';

class SaveTripCubit extends Cubit<SaveTripState> {
  final TripRepo tripRepo;
  SaveTripCubit({required this.tripRepo}) : super(SaveTripInitial());
}
