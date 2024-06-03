part of 'get_saved_trips_cubit.dart';

sealed class GetSavedTripsState extends Equatable {
  const GetSavedTripsState();

  @override
  List<Object> get props => [];
}

final class GetSavedTripsInitial extends GetSavedTripsState {}

final class GetSavedTripsLoadInProgress extends GetSavedTripsState {}

final class GetSavedTripsSuccess extends GetSavedTripsState {}

final class GetSavedTripsFailure extends GetSavedTripsState {}
