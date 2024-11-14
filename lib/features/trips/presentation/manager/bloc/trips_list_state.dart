part of 'trips_list_bloc.dart';

sealed class TripsListState extends Equatable {
  const TripsListState();

  @override
  List<Object> get props => [];
}

final class TripsListInitial extends TripsListState {}

final class TripsListLoadInProgress extends TripsListState {}

final class TripsListRefreshed extends TripsListState {
  final bool isFiltering;

  const TripsListRefreshed({this.isFiltering = false});
}

final class TripsListLoaded extends TripsListState {
  final List<TripModel> trips;
  const TripsListLoaded({required this.trips});
  @override
  List<Object> get props => [trips];
}

final class TripsListFailure extends TripsListState {
  final String errMessage;

  const TripsListFailure({required this.errMessage});
}
