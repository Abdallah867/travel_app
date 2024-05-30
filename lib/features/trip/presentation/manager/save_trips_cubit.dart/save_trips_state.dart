part of 'save_trips_cubit.dart';

sealed class SaveTripsState extends Equatable {
  const SaveTripsState();

  @override
  List<Object> get props => [];
}

final class SaveTripsInitial extends SaveTripsState {}
