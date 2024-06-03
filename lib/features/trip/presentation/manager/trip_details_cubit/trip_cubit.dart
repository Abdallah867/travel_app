import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  TripCubit() : super(TripInProgess());
}
