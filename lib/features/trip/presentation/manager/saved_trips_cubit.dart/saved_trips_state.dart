part of 'saved_trips_cubit.dart';

sealed class SavedTripsState extends Equatable {
  const SavedTripsState();

  @override
  List<Object> get props => [];
}

final class SavedTripsInitial extends SavedTripsState {}

final class SavedTripsLoadInProgress extends SavedTripsState {}

final class SavedTripsSuccess extends SavedTripsState {}

final class SavedTripsFailure extends SavedTripsState {
  final String errMessage;
  const SavedTripsFailure({required this.errMessage});
}
