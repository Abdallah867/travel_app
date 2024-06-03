part of 'trips_cubit.dart';

sealed class TripsState extends Equatable {
  const TripsState();

  @override
  List<Object> get props => [];
}

final class TripsInitial extends TripsState {}

final class TripsLoadInProgess extends TripsState {}

final class TripsLoaded extends TripsState {}

final class TripsFailure extends TripsState {
  final String errMessage;

  const TripsFailure({required this.errMessage});
}
