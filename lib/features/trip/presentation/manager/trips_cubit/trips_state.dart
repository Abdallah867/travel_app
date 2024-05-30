part of 'trips_cubit.dart';

sealed class TripsState extends Equatable {
  const TripsState();

  @override
  List<Object> get props => [];
}

final class TripsInitial extends TripsState {}

final class TripsLoadingInProgess extends TripsState {}

final class TripsLoaded extends TripsState {}

final class TripsFailure extends TripsState {}
